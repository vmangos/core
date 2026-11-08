$UTC = [DateTime]::UtcNow.ToString('yyyyMMddHHmmss')
$FilePath = "migrations\${UTC}_world.sql"

$sql = @'
DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='{{UTC}}');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('{{UTC}}');
-- Add your query below.



-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
'@

try {
    [IO.File]::WriteAllText($FilePath, $sql.Replace('{{UTC}}', $UTC), [Text.UTF8Encoding]::new($false))
    "File created: $FilePath"
} catch {
    [Console]::Error.WriteLine("Error creating file: $FilePath")
    exit 1
}