INSERT INTO `migrations` VALUES ('20170417163152'); 

-- Update the page order and remove the duplicate page
update page_text set next_page = 875 where entry = 873;
delete from page_text where entry = 874;
