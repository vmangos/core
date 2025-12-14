DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20251204093126');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20251204093126');
-- Add your query below.


-- Kobold Vermin
-- mangos: 270 
-- 1.13: 179 180 180 183 183
-- 1.14: 179 179 180 180 180 181 181 181 181 181 182 182 182 182 183 184 184 184 184 184 184 184 185
UPDATE `creature` SET `spawntimesecsmin`=180, `spawntimesecsmax`=180 WHERE 6 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Defias Thug
-- mangos: 270 
-- 1.13: 180 181 181 182 182 182 183 183 183 184 185 185
-- 1.14: 181 181 182 182 182 182 182 182 182 183 183 184 184 184 184 184 184 184 184 184 185 185 185 185 185 185 185 185 185 185 185 186 186
UPDATE `creature` SET `spawntimesecsmin`=180, `spawntimesecsmax`=180 WHERE 38 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Timber Wolf
-- mangos: 270 
-- 1.13: 180 180 180 180 182 182 182 183 183 183 184 184 185 185 185 
-- 1.14: 181
UPDATE `creature` SET `spawntimesecsmin`=180, `spawntimesecsmax`=180 WHERE 69 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Kobold Laborer
-- mangos: 270 
-- 1.13: 180 
-- 1.14: 180 181 182 183 184 
UPDATE `creature` SET `spawntimesecsmin`=180, `spawntimesecsmax`=180 WHERE 80 IN (id, id2, id3, id4, id5) && `patch_max`=10;

-- Garrick Padfoot
-- mangos: 270 
-- 1.13: 62 62 
-- 1.14: 62 62 62 65 
UPDATE `creature` SET `spawntimesecsmin`=60, `spawntimesecsmax`=65 WHERE 103 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Riverpaw Gnoll
-- mangos: 300 
-- 1.13: 417 443 469 483 
UPDATE `creature` SET `spawntimesecsmin`=420, `spawntimesecsmax`=480 WHERE 117 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Prowler
-- mangos: 270 
-- 1.14: 308 318 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=300 WHERE 118 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Remy "Two Times"
-- mangos: 270 
-- 1.13: 480 
UPDATE `creature` SET `spawntimesecsmin`=480, `spawntimesecsmax`=480 WHERE 241 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Maybell Maclure
-- mangos: 10 
-- 2.5: 15 
UPDATE `creature` SET `spawntimesecsmin`=15, `spawntimesecsmax`=15 WHERE 251 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Kobold Worker
-- mangos: 270 
-- 1.13: 180 181 181 182 182 184 
-- 1.14: 179 180 180 180 181 181 181 182 182 182 183 183 183 184 184 184 184
UPDATE `creature` SET `spawntimesecsmin`=180, `spawntimesecsmax`=180 WHERE 257 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Marshal Haggard
-- mangos: 285 
-- 2.5: 385 
UPDATE `creature` SET `spawntimesecsmin`=385, `spawntimesecsmax`=385 WHERE 294 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Young Wolf
-- mangos: 270 
-- 1.13: 181 182
-- 1.14: 179 180 181 181 181 181 182 182 182 182 182 182 183 184 184 184 184 185
UPDATE `creature` SET `spawntimesecsmin`=180, `spawntimesecsmax`=180 WHERE 299 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Goldtooth
-- mangos: 270 
-- 1.13: 62 65 
-- 1.14: 61 62 63 63 64 64 64 65
UPDATE `creature` SET `spawntimesecsmin`=60, `spawntimesecsmax`=65 WHERE 327 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Princess
-- mangos: 270 
-- 1.14: 183 
UPDATE `creature` SET `spawntimesecsmin`=180, `spawntimesecsmax`=180 WHERE 330 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Gath'Ilzogg
-- mangos: 900 
-- 1.14: 409 532 536 
UPDATE `creature` SET `spawntimesecsmin`=400, `spawntimesecsmax`=540 WHERE 334 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Singe
-- mangos: 900 
-- 1.14: 330 577 
UPDATE `creature` SET `spawntimesecsmin`=330, `spawntimesecsmax`=600 WHERE 335 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Bellygrub
-- mangos: 300 
-- 1.14: 364 
UPDATE `creature` SET `spawntimesecsmin`=360, `spawntimesecsmax`=360 WHERE 345 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Dockmaster Baren
-- mangos: 300 
-- 2.5: 341 
UPDATE `creature` SET `spawntimesecsmin`=340, `spawntimesecsmax`=340 WHERE 381 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Porcine Entourage
-- mangos: 270 
-- 1.14: 64 65 
UPDATE `creature` SET `spawntimesecsmin`=60, `spawntimesecsmax`=65 WHERE 390 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Redridge Brute
-- mangos: 300 
-- 1.13: 333 401
-- 1.14: 340 367 372 466 481 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 426 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Shadowhide Darkweaver
-- mangos: 300 
-- 1.14: 364 411 448 473 
-- 2.5: 386 478 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 429 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Redridge Mystic
-- mangos: 300 
-- 1.13: 305 307 312 352 369 371 378 396 397 418 435 460 478 
-- 1.14: 329 331 351 362 379 383 497 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 430 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Shadowhide Slayer
-- mangos: 300 
-- 1.14: 326 353 354 359 401 417 428 444 
-- 2.5: 423 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 431 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Shadowhide Brute
-- mangos: 300 
-- 1.13: 439 
-- 1.14: 338 401 404 414 
-- 2.5: 311 326 354 391 395 398 405 432 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 432 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Shadowhide Gnoll
-- mangos: 300 
-- 1.13: 326 333 338 340 343 355 363 367 385 400 421 426 428 430 431 446 448 455 458 458 464 472
-- 1.14: 315 328 344 365 368 376 382 397 397 441 457 472 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 433 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Rabid Shadowhide Gnoll
-- mangos: 300 
-- 1.13: 315 327 327 335 336 339 342 342 355 364 369 376 378 389 390 396 411 412 412 429 430 445 453 458 458 477 489
-- 1.14: 309 340 341 388 398 410 427 463 473 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 434 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Blackrock Champion
-- mangos: 300 
-- 1.13: 313 327 426 
-- 1.14: 366 372 372 378 428 433 
-- 2.5: 357 359 398 474 478 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 435 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Blackrock Shadowcaster
-- mangos: 900 
-- 1.14: 733 742 780 780 783 790 813 827 830 846 867 871 871
-- 2.5: 843 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=900 WHERE 436 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Blackrock Grunt
-- mangos: 300 
-- 1.13: 385 451 
-- 1.14: 341 387 411 427 433 440 443 456 467 469 471 479
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 440 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Redridge Basher
-- mangos: 300 
-- 1.14: 329 337 344 351 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=360 WHERE 446 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Morgan the Collector
-- mangos: 270 
-- 1.13: 70 
-- 1.14: 65 67 
UPDATE `creature` SET `spawntimesecsmin`=65, `spawntimesecsmax`=70 WHERE 473 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Tharil'zun
-- mangos: 900 
-- 1.14: 476 525 
UPDATE `creature` SET `spawntimesecsmin`=400, `spawntimesecsmax`=540 WHERE 486 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Insane Ghoul
-- mangos: 300 
-- 1.14: 360 
UPDATE `creature` SET `spawntimesecsmin`=360, `spawntimesecsmax`=360 WHERE 511 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Shadowhide Warrior
-- mangos: 300 
-- 1.13: 450 
-- 1.14: 307 382 409 411 416 435 436 444 
-- 2.5: 309 309 320 321 368 414 425 433 452 468 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 568 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Brain Eater
-- mangos: 300 
-- 1.14: 333 349 402 412 445 447 474
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 570 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Murloc Scout
-- mangos: 300 
-- 1.13: 326 
-- 1.14: 306 309 314 320 322 324 331 333 344 354 373 408 411 411 415 462
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 578 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Shadowhide Assassin
-- mangos: 300 
-- 1.14: 349 418 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 579 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Bloodscalp Warrior
-- mangos: 300 
-- 1.13: 303 310 316 317 325 354 374 446 461 468
-- 1.14: 306 328 329 335 336 350 357 389 392 457
-- 2.5: 414
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 587 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Bloodscalp Scout
-- mangos: 300 
-- 1.14: 381 409 
-- 2.5: 399 408 422 446 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 588 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Defias Pillager
-- mangos: 300 
-- 1.13: 335 346 382 388 412 421 625 
-- 1.14: 318 337 371 373 373 378 385 408 414 416 426 431 432 441 445 469 469 471 472 473 482
-- 2.5: 411
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 589 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Bloodscalp Berserker
-- mangos: 300 
-- 1.14: 357 367 380 477 
-- 2.5: 323 324 477
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 597 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Blackrock Tracker
-- mangos: 300 
-- 1.13: 304 451 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 615 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Skeletal Miner
-- mangos: 900 
-- 1.14: 727 742 760 768 772 783 801 812 832 835 846 851 884 894 900 955 958 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 623 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Undead Excavator
-- mangos: 900 
-- 1.14: 729 738 772 776 795 811 817 832 863 867 922 955 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 624 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Undead Dynamiter
-- mangos: 900 
-- 1.14: 733 738 741 785 797 836 844 847 848 858 865 868 877 904 920 941 956 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 625 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Foreman Thistlenettle
-- mangos: 300 
-- 1.14: 305 331 346 381 388 405 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=420 WHERE 626 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Skullsplitter Warrior
-- mangos: 300 
-- 1.13: 315 434 448
-- 1.14: 303 304 317 338 388 389 405 425 429 438 449
-- 2.5: 415 427
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 667 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Skullsplitter Hunter
-- mangos: 300 
-- 1.13: 413 
-- 2.5: 303 313 333 333 337 364 433 473
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 669 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Skullsplitter Spiritchaser
-- mangos: 300 
-- 1.13: 312 339 442 467 471 475 
-- 2.5: 314 374 400 412 456 466 487
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 672 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Venture Co. Strip Miner
-- mangos: 300 
-- 1.13: 305 319 323 324 332 338 347 354 371 389 414 416 424 435 440 442 469 481 
-- 1.14: 306 308 314 315 315 316 321 324 336 337 340 341 348 351 351 354 355 362 370 371 381 387 387 391 395 395 396 403 403 405 408 415 415 419 420 420 420 423 431 442 460 462 465 467 472 475 479 
-- 2.5: 309 317 318 319 320 330 333 337 340 345 347 348 349 350 353 357 358 359 360 360 360 361 362 365 367 368 374 376 379 386 388 393 396 396 398 400 401 403 411 412 419 421 422 426 448 450 450 454 455 460 467 471 475 479 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 674 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Venture Co. Foreman
-- mangos: 300 
-- 1.14: 415 468 
-- 2.5: 328 331 331 360 361 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 675 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Young Stranglethorn Tiger
-- mangos: 300 
-- 1.13: 323 378 441 477 483 
-- 1.14: 318 418 435 457 477
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 681 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Young Panther
-- mangos: 300 
-- 1.13: 318 320 322 339 349 365 468
-- 1.14: 478 484
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 683 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Stranglethorn Raptor
-- mangos: 300 
-- 1.13: 317 325 449 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 685 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Jungle Stalker
-- mangos: 300 
-- 1.13: 398 441 
-- 2.5: 415 481 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 687 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Stone Maw Basilisk
-- mangos: 300 
-- 1.14: 305 331 387 415 478
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 688 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Crystal Spine Basilisk
-- mangos: 300 
-- 1.13: 447 465 
-- 1.14: 422 
UPDATE `creature` SET `spawntimesecsmin`=420, `spawntimesecsmax`=480 WHERE 689 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Lesser Water Elemental
-- mangos: 300 
-- 1.13: 306 309 323 328 349 380 389 449 466 
-- 1.14: 403 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 691 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Bloodscalp Beastmaster
-- mangos: 300 
-- 1.13: 430 
-- 2.5: 417 429 469 
UPDATE `creature` SET `spawntimesecsmin`=360, `spawntimesecsmax`=480 WHERE 699 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Bloodscalp Scavenger
-- mangos: 300 
-- 1.14: 367 404 429 464 466 476 481
-- 2.5: 367 385 407 425 427 440 456
UPDATE `creature` SET `spawntimesecsmin`=360, `spawntimesecsmax`=480 WHERE 702 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Murloc Lurker
-- mangos: 270 
-- 1.13: 345 477 
-- 1.14: 305 333 346 362 365 462
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 732 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Murloc Streamrunner
-- mangos: 270 
-- 1.14: 307 383 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=380 WHERE 735 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Panther
-- mangos: 300 
-- 1.13: 321 333 465 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 736 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Brother Nimetz
-- mangos: 300 
-- 1.13: 150 
UPDATE `creature` SET `spawntimesecsmin`=150, `spawntimesecsmax`=150 WHERE 739 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Adolescent Whelp
-- mangos: 300 
-- 1.13: 314 327 335 353 374 393 400 414 431 479 
-- 1.14: 316 324 347 370 404 433 469 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 740 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Dreaming Whelp
-- mangos: 300 
-- 1.13: 318 348 360 368 387 405 415 470 
-- 1.14: 309 367 368 371 374 382 385 389 395 429 432 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 741 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Marsh Murloc
-- mangos: 300 
-- 1.13: 446 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 747 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Marsh Inkspewer
-- mangos: 300 
-- 2.5: 404 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 750 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Marsh Flesheater
-- mangos: 300 
-- 1.13: 409
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 751 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Rebel Watchman
-- mangos: 300 
-- 1.13: 143 
-- 2.5: 101 
UPDATE `creature` SET `spawntimesecsmin`=100, `spawntimesecsmax`=150 WHERE 754 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Lost One Hunter
-- mangos: 300 
-- 1.13: 300 469 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 759 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Lost One Muckdweller
-- mangos: 300 
-- 1.14: 413 476 
-- 2.5: 396 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 760 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Swampwalker
-- mangos: 300 
-- 1.14: 326 360 434 483 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 764 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Swampwalker Elder
-- mangos: 300 
-- 1.14: 373 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 765 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Swamp Jaguar
-- mangos: 300 
-- 1.13: 307 367 450 459 
-- 1.14: 424 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 767 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Skullsplitter Headhunter
-- mangos: 300 
-- 1.13: 330 372 400 405 
-- 1.14: 407 
-- 2.5: 385 391 433 435 438 467
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 781 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Skullsplitter Berserker
-- mangos: 300 
-- 1.13: 337 339 417 
-- 2.5: 307 382 397 457 472
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 783 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Skeletal Warder
-- mangos: 300 
-- 1.14: 396 459 
-- 2.5: 381 414 420 456 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 785 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Skeletal Healer
-- mangos: 300 
-- 2.5: 307 341 426 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 787 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Grik'nir the Cold
-- mangos: 270 
-- 1.13: 78 
-- 1.14: 63 
-- 2.5: 62 
UPDATE `creature` SET `spawntimesecsmin`=60, `spawntimesecsmax`=80 WHERE 808 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Servant of Ilgalar
-- mangos: 300 
-- 1.14: 313 330 332 335 349 356 362 415 
-- 2.5: 346 433 444 478 478 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 819 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Defias Digger
-- mangos: 300 
-- 1.14: 811 841 947
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 824 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Young Jungle Stalker
-- mangos: 300 
-- 1.13: 385 429 
-- 2.5: 484 
UPDATE `creature` SET `spawntimesecsmin`=380, `spawntimesecsmax`=480 WHERE 854 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Stonard Grunt
-- mangos: 300 
-- 2.5: 343 344 462 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 866 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Erlan Drudgemoor
-- mangos: 270 
-- 1.13: 67 
-- 1.14: 64 71 76 
UPDATE `creature` SET `spawntimesecsmin`=60, `spawntimesecsmax`=80 WHERE 880 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Surena Caledon
-- mangos: 270 
-- 1.13: 63 
-- 1.14: 82 83 84 
UPDATE `creature` SET `spawntimesecsmin`=60, `spawntimesecsmax`=80 WHERE 881 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Homer Stonefield
-- mangos: 270 
-- 2.5: 482 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 894 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Keryn Sylvius
-- mangos: 270 
-- 2.5: 471 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 917 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Nightbane Tainted One
-- mangos: 300 
-- 1.14: 343 353 452 457 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 920 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Young Black Ravager
-- mangos: 300 
-- 1.14: 312 318 318 328 331 334 340 349 357 362 364 378 389 395 397 416 458 458 460 483 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 923 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Brother Wilhelm
-- mangos: 270 
-- 2.5: 457 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 927 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Black Widow Hatchling
-- mangos: 300 
-- 1.14: 309 355 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=360 WHERE 930 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Kurzen Jungle Fighter
-- mangos: 300 
-- 1.13: 308 312 315 320 321 337 339 341 347 366 378 381 388 393 402 403 406 415 415 415 422 427 436 436 441 454 461 466 466 467 468 468 471
-- 1.14: 317 341 348 357 397 405 408 443 443 446 
-- 2.5: 307 311 319 321 322 324 328 339 345 347 348 358 359 361 363 366 370 374 383 389 402 402 403 407 413 419 432 447 450 456 461 462 477 478 478
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 937 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Kurzen Commando
-- mangos: 300 
-- 1.13: 318 336 348 355 391 417 430
-- 1.14: 308 311 314 316 325 327 337 338 341 342 343 345 350 351 355 358 364 368 368 371 372 376 377 380 386 387 389 391 409 411 412 416 417 417 418 422 424 428 429 431 434 441 443 451 452 456 458 458 467 467 471 473 477 481 485
-- 2.5: 304 307 333 431 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 938 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Kurzen Elite
-- mangos: 300 
-- 1.13: 358 367 
-- 1.14: 318 420 
-- 2.5: 331 359 398 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 939 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Kurzen Headshrinker
-- mangos: 300 
-- 1.13: 335 
-- 1.14: 310 323 323 358 362 375 385 391 409 428 443 444 453 465 473 476
-- 2.5: 323 324 476
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 941 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Kurzen Witch Doctor
-- mangos: 300 
-- 1.14: 461 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 942 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Kurzen Wrangler
-- mangos: 300 
-- 1.13: 360 441 
-- 1.14: 318 360 483 
-- 2.5: 479 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 943 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Carrion Recluse
-- mangos: 300 
-- 1.14: 394 420 423
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 949 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Kurzen War Tiger
-- mangos: 300 
-- 1.13: 351 357 
-- 1.14: 304 356 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=360 WHERE 976 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Kurzen War Panther
-- mangos: 300 
-- 1.13: 438 
-- 1.14: 337 370 
-- 2.5: 437 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 977 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Kurzen Subchief
-- mangos: 300 
-- 1.13: 336 340 414 415 471 
-- 2.5: 307 378 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 978 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Kurzen Shadow Hunter
-- mangos: 300 
-- 1.13: 369 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 979 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Black Ooze
-- mangos: 300 
-- 1.13: 340 352 362
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=360 WHERE 1032 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Dragonmaw Raider
-- mangos: 300 
-- 1.13: 350 
-- 1.14: 316 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=360 WHERE 1034 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Dark Iron Dwarf
-- mangos: 300 
-- 1.14: 307 316 322 337 362
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=360 WHERE 1051 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Dark Iron Saboteur
-- mangos: 300 400 
-- 1.14: 383 444 455 466 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1052 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Dark Iron Tunneler
-- mangos: 300 
-- 1.13: 316 
-- 1.14: 347 351 385 394 398 473
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1053 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Dark Iron Demolitionist
-- mangos: 300 
-- 1.13: 428 458
-- 1.14: 322 333 430 484 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1054 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Mogh the Undying
-- mangos: 1800 
-- 1.13: 360 
-- 2.5: 403 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1060 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Nezzliok the Dire
-- mangos: 300 
-- 1.13: 374 
-- 1.14: 330 425 
-- 2.5: 420 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1062 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Grom'gol Grunt
-- mangos: 300 
-- 2.5: 345 370 371 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=380 WHERE 1064 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Longbraid the Grim
-- mangos: 300 
-- 2.5: 381 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1071 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Roggo Harlbarrow
-- mangos: 300 
-- 2.5: 377 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1072 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Ashlan Stonesmirk
-- mangos: 300 
-- 2.5: 428 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1073 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Motley Garmason
-- mangos: 300 
-- 2.5: 430 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1074 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Sawtooth Crocolisk
-- mangos: 300 
-- 1.13: 308 349 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=360 WHERE 1082 IN (id, id2, id3, id4, id5) && `patch_max`=10;



-- Elder Stranglethorn Tiger
-- mangos: 300 
-- 1.13: 369
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1085 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Venture Co. Geologist
-- mangos: 300 
-- 1.13: 376 
-- 1.14: 407 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1096 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Skeletal Raider
-- mangos: 300 
-- 1.14: 317 352 399 406
-- 2.5: 309 314 352 365 366 412 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=420 WHERE 1110 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Rockjaw Skullthumper
-- mangos: 270 
-- 1.13: 319 362 365 
-- 1.14: 338 415 469
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1115 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Wendigo
-- mangos: 270 
-- 1.13: 181 182 183 183 185 
UPDATE `creature` SET `spawntimesecsmin`=180, `spawntimesecsmax`=180 WHERE 1135 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Mosh'Ogg Brute
-- mangos: 300 
-- 1.13: 414 436 465 479 
-- 1.14: 453 
-- 2.5: 401 
UPDATE `creature` SET `spawntimesecsmin`=400, `spawntimesecsmax`=480 WHERE 1142 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- River Crocolisk
-- mangos: 300 
-- 1.13: 356 414 
-- 1.14: 468 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1150 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Snapjaw Crocolisk
-- mangos: 300 
-- 1.14: 426 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1152 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Marek Ironheart
-- mangos: 300 
-- 2.5: 388 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1154 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Kelt Thomasin
-- mangos: 300 
-- 2.5: 350 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1155 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Vyrin Swiftwind
-- mangos: 300 
-- 2.5: 480 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1156 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Cursed Sailor
-- mangos: 300 
-- 1.13: 330 359 379 394 415 421 424 438 456 483 
-- 1.14: 315 340 363 368 439
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1157 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Cursed Marine
-- mangos: 300 
-- 1.13: 373 375 392 
-- 1.14: 327 341 364 370 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1158 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- First Mate Snellig
-- mangos: 300 
-- 1.13: 355 405 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1159 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Captain Halyndor
-- mangos: 300 
-- 1.13: 328 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1160 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Stonesplinter Skullthumper
-- mangos: 300 
-- 1.13: 340
-- 1.14: 314 322 338 339 366 369 376 379 390 405 412 412 461 469
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1163 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Stonesplinter Bonesnapper
-- mangos: 300 
-- 1.13: 468
-- 1.14: 416 416 430 434 479
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1164 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Stonesplinter Geomancer
-- mangos: 300 
-- 1.13: 342 419 
-- 1.14: 360 
-- 2.5: 464 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1165 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Grawmug
-- mangos: 300 
-- 1.14: 457 
UPDATE `creature` SET `spawntimesecsmin`=450, `spawntimesecsmax`=460 WHERE 1205 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Gnasher
-- mangos: 300 
-- 1.14: 452 
UPDATE `creature` SET `spawntimesecsmin`=450, `spawntimesecsmax`=460 WHERE 1206 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Brawler
-- mangos: 300 
-- 1.14: 455 
UPDATE `creature` SET `spawntimesecsmin`=450, `spawntimesecsmax`=460 WHERE 1207 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Leper Gnome
-- mangos: 270 
-- 1.13: 325 333 335 346 359 364 373 379 380 380 388 390 393 397 402 405 417 428 448 469 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1211 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Maxan Anvol
-- mangos: 270 
-- 2.5: 438 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1226 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Magis Sparkmantle
-- mangos: 270 
-- 2.5: 435 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1228 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Azar Stronghammer
-- mangos: 270 
-- 2.5: 337 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1232 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Hogral Bakkan
-- mangos: 270 
-- 2.5: 467 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1234 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Innkeeper Belm
-- mangos: 310 
-- 2.5: 332 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1247 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Black Ravager Mastiff
-- mangos: 300 
-- 1.14: 362 411
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1258 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Gobbler
-- mangos: 300 
-- 1.13: 427 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1259 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Ragnar Thunderbrew
-- mangos: 310 
-- 2.5: 352 355 
UPDATE `creature` SET `spawntimesecsmin`=350, `spawntimesecsmax`=360 WHERE 1267 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Ozzie Togglevolt
-- mangos: 270 
-- 2.5: 35 
UPDATE `creature` SET `spawntimesecsmin`=35, `spawntimesecsmax`=35 WHERE 1268 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Lina Stover
-- mangos: 310 
-- 2.5: 464 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1297 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Frederick Stover
-- mangos: 310 
-- 2.5: 477 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1298 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Prospector Ironband
-- mangos: 300 
-- 2.5: 361 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1344 IN (id, id2, id3, id4, id5) && `patch_max`=10;



-- Topper McNabb
-- mangos: 270 
-- 1.13: 369 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1402 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Sranda
-- mangos: 300 
-- 2.5: 453 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1407 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Squirrel
-- mangos: 270 300 
-- 1.13: 324 
-- 1.14: 449 
-- 2.5: 311 340 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1412 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Private Merle
-- mangos: 60 
-- 1.13: 31 33 
-- 2.5: 32 
UPDATE `creature` SET `spawntimesecsmin`=30, `spawntimesecsmax`=30 WHERE 1421 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Renato Gallina
-- mangos: 540 
-- 1.13: 440 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1432 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Kersok Prond
-- mangos: 300 
-- 2.5: 428 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1456 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Samor Festivus
-- mangos: 300 
-- 2.5: 425 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1457 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Drac Roughcut
-- mangos: 300 
-- 2.5: 415 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1465 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Gretta Finespindle
-- mangos: 285 
-- 2.5: 420 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1466 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Rann Flamespinner
-- mangos: 300 
-- 2.5: 326 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1474 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Zanzil Zombie
-- mangos: 300 
-- 1.13: 327 
-- 2.5: 336 350 388 441 442 442 483
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1488 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Deathguard Dillinger
-- mangos: 300 
-- 1.14: 320 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1496 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Coleman Farthing
-- mangos: 300 
-- 1.14: 483 
-- 2.5: 345 482 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1500 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Young Night Web Spider
-- mangos: 300 
-- 1.14: 181 
UPDATE `creature` SET `spawntimesecsmin`=180, `spawntimesecsmax`=180 WHERE 1504 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Scarlet Convert
-- mangos: 300 
-- 1.13: 180 181 182 182 185 185 186 454 
-- 1.14: 180 182 183 183 183 183 184 184 184 185 186 
-- 2.5: 182 185 
UPDATE `creature` SET `spawntimesecsmin`=180, `spawntimesecsmax`=180 WHERE 1506 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Scarlet Initiate
-- mangos: 300 
-- 1.13: 182 186
-- 2.5: 184 
UPDATE `creature` SET `spawntimesecsmin`=180, `spawntimesecsmax`=180 WHERE 1507 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Apothecary Johaan
-- mangos: 300 
-- 1.14: 333 
-- 2.5: 322 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1518 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Gretchen Dedmar
-- mangos: 300 
-- 2.5: 359 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1521 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Rotting Dead
-- mangos: 300 
-- 1.14: 328 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1525 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Rotting Ancestor
-- mangos: 300 
-- 1.13: 343 385 400 401 407 444 451 459 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1530 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Wailing Ancestor
-- mangos: 300 
-- 1.13: 355 372 383 473 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1534 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Scarlet Warrior
-- mangos: 300 
-- 1.13: 323 
-- 2.5: 379 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1535 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Scarlet Missionary
-- mangos: 300 
-- 1.13: 442 
-- 1.14: 314 331 334 337 339 353 357 363 388 433 439 469 480 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1536 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Scarlet Zealot
-- mangos: 300 
-- 1.13: 324 351 383 404 417 454 
-- 1.14: 311 315 322 337 356 377 389 400 408 430 441 448 460 472 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1537 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Scarlet Friar
-- mangos: 300 
-- 1.13: 462 
-- 2.5: 331 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1538 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Scarlet Neophyte
-- mangos: 300 
-- 1.13: 319 418 
-- 2.5: 317 465 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1539 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Scarlet Vanguard
-- mangos: 300 
-- 1.13: 363 
-- 2.5: 312 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1540 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Vile Fin Puddlejumper
-- mangos: 300 
-- 1.13: 352 
-- 1.14: 482 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1543 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Vile Fin Minor Oracle
-- mangos: 300 
-- 1.14: 358 367 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1544 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Vile Fin Muckdweller
-- mangos: 300 
-- 1.13: 432 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1545 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Cursed Darkhound
-- mangos: 300 
-- 1.13: 319
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1548 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Ironjaw Basilisk
-- mangos: 300 
-- 1.14: 327 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1551 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Yvette Farthing
-- mangos: 300 
-- 1.14: 479 
-- 2.5: 394 416 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1560 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Bloodsail Raider
-- mangos: 300 
-- 1.13: 427
-- 1.14: 361 416 426 447
-- 2.5: 453
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1561 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Bloodsail Swashbuckler
-- mangos: 300 
-- 1.14: 381 396 422 429 440 446 475
-- 2.5: 363 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1563 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Bloodsail Sea Dog
-- mangos: 300 
-- 1.13: 335 371 375 462 
-- 1.14: 370 370 391 422 454 475 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1565 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Adele Fielder
-- mangos: 285 
-- 2.5: 463 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1632 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Deathguard Burgess
-- mangos: 300 
-- 1.14: 454 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1652 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Bloodsail Elder Magus
-- mangos: 300 
-- 1.13: 372 395 422 430 472 
-- 1.14: 339 363 444 472 473 
-- 2.5: 304 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1653 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Captain Perrine
-- mangos: 300 
-- 1.13: 88 
-- 1.14: 75 79 
UPDATE `creature` SET `spawntimesecsmin`=60, `spawntimesecsmax`=90 WHERE 1662 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Captain Melrache
-- mangos: 300 
-- 2.5: 66 
UPDATE `creature` SET `spawntimesecsmin`=60, `spawntimesecsmax`=80 WHERE 1665 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Meven Korgal
-- mangos: 300 
-- 1.13: 60 61 61 62 64 65 65 
-- 1.14: 61 62 62 
-- 2.5: 66 
UPDATE `creature` SET `spawntimesecsmin`=60, `spawntimesecsmax`=65 WHERE 1667 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Rot Hide Mongrel
-- mangos: 300 
-- 1.13: 418 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1675 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Avarus Kharag
-- mangos: 285 
-- 2.5: 384 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1679 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Yanni Stoutheart
-- mangos: 300 
-- 2.5: 429 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1682 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Kreg Bilmn
-- mangos: 270 
-- 2.5: 329 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1691 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Gremlock Pilsnor
-- mangos: 270 
-- 2.5: 395 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1699 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Defias Watchman
-- mangos: 300 43200 
-- 1.14: 814 894 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 1725 IN (id, id2, id3, id4, id5) && `patch_max`=10 && `map`=0;


-- Defias Magician
-- mangos: 300 
-- 1.14: 753 825 879 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 1726 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Defias Worker
-- mangos: 300 
-- 1.14: 734 743 791 791 805 828 841 847 849 858 867 880 915 917 919 927 932 941 952 956 958
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 1727 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Deathguard Terrence
-- mangos: 300 
-- 2.5: 309 322 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1738 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Deathguard Lawrence
-- mangos: 300 
-- 2.5: 327 363 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1743 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Deathguard Mort
-- mangos: 300 
-- 2.5: 344 353 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1744 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Deathguard Morris
-- mangos: 300 
-- 1.14: 387 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1745 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Maggot Eye
-- mangos: 300 
-- 1.13: 61 65 
UPDATE `creature` SET `spawntimesecsmin`=60, `spawntimesecsmax`=65 WHERE 1753 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Lord Gregor Lescovar
-- mangos: 120 
-- 1.14: 4 5 5 
-- 2.5: 5 
UPDATE `creature` SET `spawntimesecsmin`=5, `spawntimesecsmax`=5 WHERE 1754 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Stormwind Royal Guard
-- mangos: 350 430 
-- 1.14: 303 307 316 329 332 342 344 359 367 373 375 380 383 387 398 406 407 409 411 414 430 435 444 459 466 468 471 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1756 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Worg
-- mangos: 300 
-- 1.13: 378 402 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1765 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Mottled Worg
-- mangos: 413 
-- 1.13: 312 357 443 454 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1766 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Vile Fin Shredder
-- mangos: 413 
-- 1.13: 333 414 420 430 455 465 469
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1767 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Vile Fin Tidehunter
-- mangos: 413 
-- 1.13: 336 424
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1768 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Zun'dartha
-- mangos: 300 
-- 2.5: 398 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1775 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Moonrage Glutton
-- mangos: 413 
-- 1.13: 244 245 246 248 251 255 256 259 264 266 270 283 295 300 300 312 316 317 317 323 326 338 347 348 350 351 354 362 
UPDATE `creature` SET `spawntimesecsmin`=240, `spawntimesecsmax`=360 WHERE 1779 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Moss Stalker
-- mangos: 413 
-- 1.13: 369 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1780 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Moonrage Darksoul
-- mangos: 413 
-- 1.13: 243 268 269 347 
UPDATE `creature` SET `spawntimesecsmin`=240, `spawntimesecsmax`=360 WHERE 1782 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Skeletal Flayer
-- mangos: 315 
-- 1.13: 306 306 307 308 317 318 323 329 332 333 335 339 346 346 347 348 349 352 366 368 373 373 373 373 380 380 381 382 393 395 398 399 403 403 405 412 413 414 415 418 421 421 422 424 432 437 438 439 444 445 445 449 450 451 455 456 457 465 467 479 480 481
-- 1.14: 308 324 344 345 348 351 380 397 403 406 413 452 452 459 469 473
-- 2.5: 346 402 459 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1783 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Skeletal Sorcerer
-- mangos: 315 
-- 1.13: 346 425 
-- 1.14: 328 361
-- 2.5: 303 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1784 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Skeletal Terror
-- mangos: 315 
-- 1.13: 381 
-- 1.14: 350 442 467 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1785 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Skeletal Executioner
-- mangos: 315 
-- 1.13: 321 327 390 424 431
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1787 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Skeletal Acolyte
-- mangos: 315 
-- 1.13: 315 463
-- 2.5: 349 419 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1789 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Slavering Ghoul
-- mangos: 315 
-- 1.13: 305 311 314 317 320 326 327 327 333 334 337 345 349 354 358 360 362 362 372 381 385 403 404 404 407 415 418 421 422 430 434 438 440 440 446 446 450 454 461 466 472 4826 
-- 1.14: 317 319 327 342 369 382 392 400 403 412 425 445 447 484 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1791 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Soulless Ghoul
-- mangos: 315 
-- 1.13: 310 317 325 393 455
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1794 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Rotting Behemoth
-- mangos: 315 
-- 1.13: 422 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1812 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Diseased Black Bear
-- mangos: 315 
-- 1.13: 321 322 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1815 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Diseased Wolf
-- mangos: 315 
-- 1.13: 416 
-- 2.5: 456 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1817 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Venom Mist Lurker
-- mangos: 315 
-- 1.13: 475 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1822 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Scarlet Hunter
-- mangos: 315 
-- 1.14: 316 327 341 356 414 452 
-- 2.5: 484 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1831 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Tharek Blackstone
-- mangos: 270 
-- 2.5: 367 
UPDATE `creature` SET `spawntimesecsmin`=360, `spawntimesecsmax`=360 WHERE 1872 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Rattlecage Skeleton
-- mangos: 300 
-- 1.14: 180 181 181 181 182 183 183 184 184 185 185 185
UPDATE `creature` SET `spawntimesecsmin`=180, `spawntimesecsmax`=180 WHERE 1890 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Pyrewood Watcher
-- mangos: 300 500 
-- 1.13: 309 313 322 323 325 326 326 331 361 372 376 387 394 408 427 428 433 434 451 
-- 2.5: 385 388 390 393 445 456 460 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1891 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Pyrewood Sentry
-- mangos: 300 500 
-- 1.13: 355 363 364 374 381 403 414 431 448 451 454 476 479
-- 2.5: 357 389 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1894 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Pyrewood Elder
-- mangos: 300 500 
-- 1.13: 313 351 362 370 376 379 417 421 470 481
-- 2.5: 393 468 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1895 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Dalaran Protector
-- mangos: 413 
-- 1.13: 333 378 400 425 
-- 2.5: 429 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1912 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Dalaran Warder
-- mangos: 413 
-- 1.13: 324 328 336 369 403 461 470 
-- 2.5: 310 360 365 436 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1913 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Dalaran Mage
-- mangos: 413 
-- 1.13: 383 385 402 
-- 2.5: 319 449 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1914 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Dalaran Conjuror
-- mangos: 413 
-- 1.13: 336 348 351 356 
-- 2.5: 346 409 480 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1915 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Captured Scarlet Zealot
-- mangos: 300 
-- 1.13: 16 18 19 19 19 
-- 1.14: 19 
UPDATE `creature` SET `spawntimesecsmin`=15, `spawntimesecsmax`=20 WHERE 1931 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Rot Hide Brute
-- mangos: 413 
-- 1.13: 307 308 312 317 323 325 325 327 328 332 332 332 333 336 345 349 358 360 361 363 365 373 374 376 381 385 386 394 403 403 404 416 418 423 426 430 433 438 442 444 450 455 459 464 471 477 481 484
-- 1.14: 449 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1939 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Rot Hide Plague Weaver
-- mangos: 413 
-- 1.13: 303 317 318 320 321 326 327 356 357 372 376 390 391 391 396 397 401 405 407 409 413 414 414 420 422 428 429 430 444 445 453 457 470 476 478 478
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1940 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Rot Hide Savage
-- mangos: 413 
-- 1.13: 315 321 324 325 346 346 347 356 361 364 367 371 377 395 409 411 412 417 421 451 452 460 462 472 475 
-- 1.14: 328 380 408 421 445 448 455 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1942 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Raging Rot Hide
-- mangos: 413 
-- 1.13: 320 344 345 346 360 361 413 423 429
-- 1.14: 400 455 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1943 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- High Executor Hadrec
-- mangos: 275 
-- 2.5: 374 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1952 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Vile Fin Shorecreeper
-- mangos: 413 
-- 2.5: 356 395 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1957 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Ivar the Foul
-- mangos: 413 
-- 1.13: 371 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1971 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Ravenclaw Guardian
-- mangos: 413 
-- 1.13: 347 401 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1973 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Ravenclaw Drudger
-- mangos: 413 
-- 1.13: 374 429 
-- 1.14: 392 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1974 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Deathstalker Erland
-- mangos: 413 
-- 1.13: 437 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1978 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Young Thistle Boar
-- mangos: 300 
-- 1.13: 182 182 184 
-- 1.14: 180
UPDATE `creature` SET `spawntimesecsmin`=180, `spawntimesecsmax`=180 WHERE 1984 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Webwood Spider
-- mangos: 300 
-- 1.13: 181 185 185
-- 1.14: 182 182 183 183 184 186
UPDATE `creature` SET `spawntimesecsmin`=180, `spawntimesecsmax`=180 WHERE 1986 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Greenpaw
-- mangos: 300 
-- 1.13: 420 428 
-- 1.14: 332 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1993 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Strigid Screecher
-- mangos: 300 
-- 1.14: 384 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1996 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Webwood Lurker
-- mangos: 300 
-- 1.13: 318 
-- 1.14: 421 456 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 1998 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Rascal Sprite
-- mangos: 300 
-- 1.13: 451 
-- 1.14: 424 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2002 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Shadow Sprite
-- mangos: 300 
-- 1.13: 349 416 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2003 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Dark Sprite
-- mangos: 300 
-- 1.13: 413 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2004 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Gnarlpine Shaman
-- mangos: 300 
-- 1.13: 304 304 310 313 316 319 329 337 338 343 352 365 366 368 371 373 373 377 381 397 407 408 410 420 430 433 441 442 447 449 466 471 473
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2009 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Gnarlpine Augur
-- mangos: 300 
-- 1.13: 308 324 430 451 461 479
-- 1.14: 370 432 482 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2011 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Young Nightsaber
-- mangos: 300 
-- 1.13: 181 183 
UPDATE `creature` SET `spawntimesecsmin`=180, `spawntimesecsmax`=180 WHERE 2031 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Mangy Nightsaber
-- mangos: 300 
-- 1.13: 180 
-- 1.14: 183 
UPDATE `creature` SET `spawntimesecsmin`=180, `spawntimesecsmax`=180 WHERE 2032 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Lord Melenas
-- mangos: 300 
-- 1.13: 63 
UPDATE `creature` SET `spawntimesecsmin`=60, `spawntimesecsmax`=65 WHERE 2038 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Ancient Protector
-- mangos: 300 
-- 1.14: 363 380 399 446 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2041 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Nightsaber
-- mangos: 300 
-- 1.14: 326 436 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2042 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Nightsaber Stalker
-- mangos: 300 
-- 1.14: 303 342 343 350 364 372 373 388 424 443 452 462 469 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2043 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Raleigh Andrean
-- mangos: 300 
-- 2.5: 388 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2050 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Haggard Refugee
-- mangos: 413 
-- 2.5: 340 345 381 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2053 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Sickly Refugee
-- mangos: 413 
-- 2.5: 318 366 405 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2054 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Master Apothecary Faranell
-- mangos: 300 
-- 2.5: 432 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2055 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Deathstalker Faerleia
-- mangos: 413 
-- 1.13: 363 412 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2058 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Valstag Ironjaw
-- mangos: 300 
-- 2.5: 334 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2086 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Harlo Barnaby
-- mangos: 300 
-- 2.5: 368 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2097 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Dragonmaw Scout
-- mangos: 300 
-- 1.13: 414 
-- 1.14: 308 330 389 418 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2103 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Black Rat
-- mangos: 300 
-- 1.13: 304 323 330 389 432 454 
-- 1.14: 336 355 357 363 429 448 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2110 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Faruza
-- mangos: 300 
-- 1.14: 479 
-- 2.5: 389 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2114 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Abigail Shiel
-- mangos: 300 
-- 1.14: 469 
-- 2.5: 350 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2118 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Shadow Priest Allister
-- mangos: 413 
-- 2.5: 305 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=300 WHERE 2121 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Cain Firesong
-- mangos: 300 
-- 1.14: 381 
-- 2.5: 475 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2128 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Dark Cleric Beryl
-- mangos: 300 
-- 2.5: 426 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2129 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Marion Call
-- mangos: 300 
-- 2.5: 449 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2130 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Austil de Mon
-- mangos: 300 
-- 1.14: 399 
-- 2.5: 372 433 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2131 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Carolai Anise
-- mangos: 300 
-- 1.14: 339 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2132 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Eliza Callen
-- mangos: 300 
-- 2.5: 442 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2137 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Edwin Harly
-- mangos: 413 
-- 2.5: 342 440 454 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2140 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Grizzled Thistle Bear
-- mangos: 413 
-- 1.13: 351 355 408 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2165 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Blackwood Warrior
-- mangos: 413 
-- 1.13: 385 438 
-- 1.14: 411 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2168 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Blackwood Totemic
-- mangos: 413 
-- 1.13: 401 
-- 1.14: 313 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2169 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Blackwood Shaman
-- mangos: 413 
-- 1.13: 356 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2171 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Writhing Highborne
-- mangos: 413 
-- 1.13: 449 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2177 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Stormscale Wave Rider
-- mangos: 720 
-- 1.13: 312 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2179 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Stormscale Siren
-- mangos: 720 
-- 1.13: 338 
-- 1.14: 411 476 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2180 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Vile Sprite
-- mangos: 413 
-- 1.14: 403 410 454 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2189 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Greymist Warrior
-- mangos: 360 413 
-- 1.13: 392 
-- 1.14: 307 320 346 365 367 373 379 434 439 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2205 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Greymist Oracle
-- mangos: 413 
-- 1.14: 387 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2207 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Deathguard Royann
-- mangos: 300 
-- 2.5: 329 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2210 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Captured Mountaineer
-- mangos: 10 
-- 1.13: 17 17 18 19 19 21 
-- 1.14: 18 
UPDATE `creature` SET `spawntimesecsmin`=15, `spawntimesecsmax`=20 WHERE 2211 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Umpi
-- mangos: 120 
-- 1.13: 46 46 46 47 47 47 48 49 50 51 
-- 2.5: 47 
UPDATE `creature` SET `spawntimesecsmin`=45, `spawntimesecsmax`=50 WHERE 2230 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Syndicate Footpad
-- mangos: 300 
-- 1.13: 302 376
-- 1.14: 400 404 414 416 465
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2240 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Syndicate Spy
-- mangos: 300 
-- 1.13: 304 
-- 1.14: 326 432 
-- 2.5: 308 361 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2242 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Syndicate Shadow Mage
-- mangos: 300 
-- 1.13: 332 356 400 434 
-- 1.14: 317 
-- 2.5: 308 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2244 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Syndicate Assassin
-- mangos: 300 
-- 1.13: 337 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2246 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Syndicate Enforcer
-- mangos: 300 
-- 1.14: 469 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2247 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Cave Yeti
-- mangos: 300 
-- 1.13: 319 323 324 324 328 328 333 339 340 349 351 357 362 378 386 399 415 429 434 444 452 463 468 475
-- 1.14: 327 331 348 351 366 368 376 395 446 449 481 484
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2248 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Ferocious Yeti
-- mangos: 300 
-- 1.13: 304 320 326 332 333 338 355 356 361 373 379 392 404 434 440 448 450
-- 1.14: 312 341 344 350 351 358 373 405 452 463
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2249 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Giant Yeti
-- mangos: 300 
-- 1.14: 410 480 481 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2251 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Crushridge Ogre
-- mangos: 300 
-- 1.13: 396 
-- 1.14: 379 457 473
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2252 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Crushridge Brute
-- mangos: 300 
-- 1.14: 453 468
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2253 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Crushridge Mauler
-- mangos: 300 
-- 1.13: 774 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=900 WHERE 2254 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Crushridge Enforcer
-- mangos: 300 
-- 1.13: 740 759 867 869 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=900 WHERE 2256 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Mug'thol
-- mangos: 300 
-- 1.13: 341 
-- 1.14: 417 
-- 2.5: 380 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2257 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Syndicate Rogue
-- mangos: 300 
-- 1.13: 339 400 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2260 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Syndicate Watchman
-- mangos: 300 
-- 1.13: 315 342 406 408 440 467 
-- 1.14: 388 
-- 2.5: 314 385 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2261 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Marshal Redpath
-- mangos: 300 
-- 2.5: 323 351 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=360 WHERE 2263 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Hillsbrad Footman
-- mangos: 300 
-- 1.13: 6310 312 328 333 335 346 346 385 386 403 446 466 473 475 479 
-- 1.14: 390 397 419 
-- 2.5: 324 361 398 430 455
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2268 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Hillsbrad Miner
-- mangos: 300 
-- 1.13: 314 319 325 328 332 332 336 347 368 373 377 391 398 411 412 418 428 431 441 453 465 465 473 478 
-- 1.14: 367 371 417 430 438 440 459 460 
-- 2.5: 305 310 313 315 319 324 330 331 332 333 338 349 365 369 374 377 392 401 420 424 428 439 439 441 443 447 456 458 484
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2269 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Hillsbrad Sentry
-- mangos: 300 
-- 1.14: 455 
-- 2.5: 407 408 441 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2270 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Dalaran Shield Guard
-- mangos: 300 
-- 1.13: 331 332 333 335 352 375 380 383 386 390 401 403 414 416 425 441 445 447 447 467 473
-- 1.14: 332 382 
-- 2.5: 303 305 309 326 331 331 332 334 338 338 396 404 412 431 447 450
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2271 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Dalaran Theurgist
-- mangos: 300 
-- 1.13: 311 314 439 457 
-- 1.14: 433 
-- 2.5: 306 379 445 469 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2272 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Loremaster Dibbs
-- mangos: 300 
-- 2.5: 386 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2277 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Melisara
-- mangos: 300 
-- 2.5: 240 
UPDATE `creature` SET `spawntimesecsmin`=240, `spawntimesecsmax`=240 WHERE 2278 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Captured Farmer
-- mangos: 300 
-- 1.13: 45 45 45 45 46 47 47 48 48 48 48 49 49 49 50 50 
-- 2.5: 47 47 49 49 
UPDATE `creature` SET `spawntimesecsmin`=45, `spawntimesecsmax`=50 WHERE 2284 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Crushridge Warmonger
-- mangos: 300 
-- 1.13: 755 805 887 936 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 2287 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Foreman Bonds
-- mangos: 300 
-- 1.13: 377 
-- 2.5: 314 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2305 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Andrew Brownell
-- mangos: 300 
-- 1.13: 326 
-- 1.14: 364 384 441 474 481 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2308 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Thomas Arlento
-- mangos: 300 
-- 2.5: 307 396 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2309 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Argus Shadow Mage
-- mangos: 300 
-- 1.14: 477 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2318 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Syndicate Wizard
-- mangos: 300 
-- 2.5: 334 348 388 402 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2319 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Thamner Pol
-- mangos: 270 
-- 2.5: 403 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2326 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Henchman Valik
-- mangos: 300 
-- 1.13: 459 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2333 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Dark Strand Fanatic
-- mangos: 413 
-- 1.14: 357 400 421 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2336 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Twilight Disciple
-- mangos: 413 
-- 1.13: 336 440 451 482 
-- 1.14: 333 478 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2338 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Twilight Thug
-- mangos: 413 
-- 1.13: 423 
-- 1.14: 407 
-- 2.5: 323 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2339 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Dun Garok Mountaineer
-- mangos: 300 
-- 1.13: 785 788 
-- 2.5: 728 756 916 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 2344 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Dun Garok Rifleman
-- mangos: 300 
-- 2.5: 856 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 2345 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Dun Garok Priest
-- mangos: 300 
-- 2.5: 758 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 2346 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Forest Moss Creeper
-- mangos: 300 
-- 1.14: 479 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2350 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Gray Bear
-- mangos: 300 
-- 1.13: 306 318 338 342 394 405 429 482 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2351 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Innkeeper Anderson
-- mangos: 300 
-- 2.5: 466 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2352 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Vicious Gray Bear
-- mangos: 300 
-- 1.13: 430
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2354 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Dalaran Summoner
-- mangos: 300 
-- 2.5: 353 473 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2358 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Elemental Slave
-- mangos: 275 300 
-- 1.13: 349 
-- 1.14: 407 
-- 2.5: 373 412 476 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2359 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Neema
-- mangos: 300 
-- 2.5: 389 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2364 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Bront Coldcleave
-- mangos: 300 
-- 2.5: 467 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2365 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Barkeep Kelly
-- mangos: 300 
-- 2.5: 352 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2366 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Daggerspine Shorestalker
-- mangos: 300 
-- 1.13: 382 397 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2368 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Daggerspine Shorehunter
-- mangos: 300 
-- 1.14: 316 446 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2369 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Daggerspine Screamer
-- mangos: 300 
-- 1.13: 407 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2370 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Daggerspine Siren
-- mangos: 300 
-- 1.14: 312 319 379 404 471 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2371 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Mudsnout Shaman
-- mangos: 300 
-- 1.13: 420 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2373 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Torn Fin Muckdweller
-- mangos: 300 
-- 1.13: 323 
-- 1.14: 363 400 434 451 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2374 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Torn Fin Coastrunner
-- mangos: 300 
-- 1.14: 315 392 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2375 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Torn Fin Oracle
-- mangos: 300 
-- 1.13: 310 317 327 333 399 421 429 474 
-- 1.14: 316 317 334 365 370 388 410 423 437
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2376 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Torn Fin Tidehunter
-- mangos: 300 
-- 1.13: 297 314 445 472 
-- 1.14: 311 333 339 383 387 391 462
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2377 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Kundric Zanden
-- mangos: 300 
-- 2.5: 347 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2378 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Nandar Branson
-- mangos: 300 
-- 2.5: 431 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2380 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Starving Mountain Lion
-- mangos: 300 
-- 1.13: 347 431 444 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2384 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Southshore Guard
-- mangos: 300 
-- 2.5: 339 349 369 403 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2386 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Hillsbrad Councilman
-- mangos: 300 
-- 1.13: 324 416 420 
-- 2.5: 445 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2387 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Mallen Swain
-- mangos: 300 
-- 2.5: 377 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2394 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Daryl Stack
-- mangos: 300 
-- 2.5: 400 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2399 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Kayren Soothallow
-- mangos: 300 
-- 2.5: 364 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2401 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Shara Blazen
-- mangos: 300 
-- 2.5: 371 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2402 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Mountain Lion
-- mangos: 300 
-- 1.13: 364 411 479 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2406 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Hulking Mountain Lion
-- mangos: 300 
-- 1.14: 452
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2407 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Snapjaw
-- mangos: 300 
-- 1.13: 455 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2408 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Ricter
-- mangos: 300 
-- 1.13: 482 
-- 2.5: 428 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2411 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Alina
-- mangos: 300 
-- 1.13: 461 
-- 2.5: 448 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2412 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Dermot
-- mangos: 300 
-- 1.13: 463 
-- 2.5: 480 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2413 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Kegan Darkmar
-- mangos: 300 
-- 1.13: 453 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2414 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Warden Belamoore
-- mangos: 300 
-- 1.13: 319 341 410 429 
-- 2.5: 315 367 449 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2415 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Crushridge Plunderer
-- mangos: 300 
-- 1.13: 356 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2416 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Grel'borg the Miser
-- mangos: 600 
-- 1.13: 416 
-- 1.14: 382 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2417 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Targ
-- mangos: 300 
-- 1.13: 479 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2420 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Chef Jessen
-- mangos: 300 
-- 2.5: 331 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2430 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Farmer Kent
-- mangos: 300 
-- 2.5: 376 385 390 393 421 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2436 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Citizen Wilkes
-- mangos: 300 
-- 2.5: 341 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2449 IN (id, id2, id3, id4, id5) && `patch_max`=10;

-- Hillsbrad Foreman
-- mangos: 300 
-- 1.13: 402 467 468 
-- 2.5: 337 339 344 473
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2503 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Mountaineer Kamdar
-- mangos: 300 
-- 2.5: 431 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2516 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Yenniku
-- mangos: 300 
-- 1.14: 349 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2530 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Zanzil the Outcast
-- mangos: 300 
-- 1.14: 315 436 
-- 2.5: 337 362 435 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2534 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Archmage Ansirem Runeweaver
-- mangos: 300 
-- 1.13: 181 
UPDATE `creature` SET `spawntimesecsmin`=180, `spawntimesecsmax`=180 WHERE 2543 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Fleet Master Firallon
-- mangos: 300 
-- 1.13: 417 506 
UPDATE `creature` SET `spawntimesecsmin`=400, `spawntimesecsmax`=500 WHERE 2546 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Garr Salthoof
-- mangos: 300 
-- 1.13: 437 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2549 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Captain Stillwater
-- mangos: 300 
-- 1.13: 422 425 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2550 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Brutus
-- mangos: 300 
-- 1.13: 322 341 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2551 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Witherbark Witch Doctor
-- mangos: 400 
-- 1.13: 379 443 
-- 1.14: 329 341 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2555 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Witherbark Headhunter
-- mangos: 120 400 
-- 1.13: 444 468 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2556 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Highland Fleshstalker
-- mangos: 400 
-- 1.13: 307 317 318 351 353 361 391 399 400 430 439 451 469 480
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2561 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Boulderfist Ogre
-- mangos: 400 
-- 1.14: 450 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2562 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Boulderfist Enforcer
-- mangos: 400 
-- 1.14: 334 442 466 484 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2564 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Boulderfist Mauler
-- mangos: 400 
-- 2.5: 425 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2569 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Boulderfist Shaman
-- mangos: 400 
-- 1.13: 386 408
-- 2.5: 441 464 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2570 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Boulderfist Lord
-- mangos: 400 
-- 1.14: 457 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2571 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Drywhisker Kobold
-- mangos: 400 
-- 1.13: 304 306 306 322 351 369 376 389 404 409 409 422 449 450 461
-- 2.5: 481
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2572 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Drywhisker Surveyor
-- mangos: 400 
-- 1.13: 383 425 456 462 467 469 486 
-- 2.5: 383 391 397 407 415 425 430 434 437 450 455 473
UPDATE `creature` SET `spawntimesecsmin`=380, `spawntimesecsmax`=480 WHERE 2573 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Drywhisker Digger
-- mangos: 400 
-- 1.13: 373 389 394 397 398 435 480 
-- 2.5: 384 389 389 398 402 425 447 456 473
UPDATE `creature` SET `spawntimesecsmin`=380, `spawntimesecsmax`=480 WHERE 2574 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Dark Iron Supplier
-- mangos: 400 
-- 1.13: 420 
UPDATE `creature` SET `spawntimesecsmin`=420, `spawntimesecsmax`=420 WHERE 2575 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Dark Iron Shadowcaster
-- mangos: 400 
-- 1.13: 386 472 
UPDATE `creature` SET `spawntimesecsmin`=380, `spawntimesecsmax`=480 WHERE 2577 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Syndicate Highwayman
-- mangos: 400 
-- 1.13: 348 407 411 413 416 429 459 468 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2586 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Syndicate Pathstalker
-- mangos: 400 
-- 1.13: 306 310 318 338 339 399 452 455 465 478 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2587 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Syndicate Prowler
-- mangos: 400 
-- 1.13: 723 725 725 737 741 751 752 766 775 776 798 801 817 817 832 832 847 886 893 898 904 905 905 910 912 914 920 934 941 945 946 949
-- 1.14: 744 758 762 781 793 801 832 836 839 865 865 888 901 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 2588 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Syndicate Mercenary
-- mangos: 400 
-- 1.13: 316 332 404 413 421 445 455 455 462 477
-- 1.14: 330 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2589 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Syndicate Conjuror
-- mangos: 400 
-- 1.13: 733 736 755 802 824 854 855 884 911 911 913 919 940
-- 1.14: 747 771 825 855 866 891 939 951 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 2590 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Syndicate Magus
-- mangos: 400 
-- 1.13: 737 773 779 795 803 922 
-- 1.14: 734 755 764 792 801 833 851 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 2591 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Lord Falconcrest
-- mangos: 400 
-- 1.13: 319 396 
-- 1.14: 451 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2597 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Otto
-- mangos: 400 
-- 1.13: 424 482 
-- 1.14: 429 438 
UPDATE `creature` SET `spawntimesecsmin`=420, `spawntimesecsmax`=480 WHERE 2599 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Shakes O'Breen
-- mangos: 400 
-- 2.5: 184 
UPDATE `creature` SET `spawntimesecsmin`=180, `spawntimesecsmax`=180 WHERE 2610 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Hammerfall Guardian
-- mangos: 400 
-- 2.5: 304 319 322 376 438 453 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2621 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Old Man Heming
-- mangos: 300 
-- 1.14: 349 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2626 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Dalaran Worker
-- mangos: 300 
-- 2.5: 430 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=300 WHERE 2628 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Vilebranch Hideskinner
-- mangos: 350 
-- 1.13: 883 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 2644 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Vilebranch Shadow Hunter
-- mangos: 350 
-- 1.14: 733 845 862 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 2645 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Vilebranch Blood Drinker
-- mangos: 350 
-- 1.13: 882 898 940 956 
-- 1.14: 741 751 807 812 868 874 909 932 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 2646 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Vilebranch Soul Eater
-- mangos: 350 
-- 1.13: 872 940 
-- 1.14: 803 854 910
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 2647 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Vilebranch Aman'zasi Guard
-- mangos: 350 
-- 1.13: 371 426
UPDATE `creature` SET `spawntimesecsmin`=360, `spawntimesecsmax`=420 WHERE 2648 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Witherbark Scalper
-- mangos: 350 
-- 1.13: 315 339 374 412 
-- 2.5: 432 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2649 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Witherbark Zealot
-- mangos: 350 
-- 1.13: 398 483 
-- 2.5: 303 438 463 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2650 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Witherbark Hideskinner
-- mangos: 350 
-- 1.13: 376 450 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2651 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Witherbark Venomblood
-- mangos: 350 
-- 1.13: 320 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2652 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Green Sludge
-- mangos: 350 
-- 1.13: 389 428 
-- 1.14: 309 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2655 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Trained Razorbeak
-- mangos: 350 
-- 1.13: 326 453 
-- 1.14: 339 433 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2657 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Highvale Outrunner
-- mangos: 350 
-- 2.5: 798
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 2691 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Highvale Scout
-- mangos: 350 
-- 1.13: 734 906 
-- 2.5: 773 939
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 2692 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Highvale Marksman
-- mangos: 350 
-- 1.13: 840 954 959 
-- 1.14: 800 
-- 2.5: 787 886
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 2693 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Highvale Ranger
-- mangos: 350 
-- 1.13: 797 885 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 2694 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Zengu
-- mangos: 400 
-- 2.5: 346 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2703 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Tor'gan
-- mangos: 400 
-- 2.5: 5 5 
UPDATE `creature` SET `spawntimesecsmin`=5, `spawntimesecsmax`=5 WHERE 2706 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Phin Odelic
-- mangos: 300 
-- 2.5: 416 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2711 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Stone Golem
-- mangos: 300 
-- 2.5: 372 377 435 442 457 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2723 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Scalding Whelp
-- mangos: 300 
-- 1.13: 314 
-- 2.5: 411 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2725 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Crag Coyote
-- mangos: 300 
-- 1.13: 368 394
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2727 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Lesser Rock Elemental
-- mangos: 300 
-- 1.13: 308 308 329 329 332 336 343 351 358 358 360 364 372 372 377 383 391 398 399 402 403 406 408 412 413 415 421 422 422 424 426 439 445 446 452 453 459 466 470 470 471 475 478 482 482 483 
-- 1.14: 319 328 329 334 336 337 345 347 354 363 365 366 368 372 375 377 385 391 399 402 408 414 416 418 425 427 435 439 444 445 459 460 474 
-- 2.5: 312 342 353 354 370 380 389 401 430 464
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2735 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Greater Rock Elemental
-- mangos: 300 
-- 1.13: 352 416 425 
-- 1.14: 335 
-- 2.5: 458 472 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2736 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Shadowforge Chanter
-- mangos: 300 
-- 1.13: 363 
-- 1.14: 321 
-- 2.5: 306 316 322 323 325 334 350 367 372 381 390 392 395 425 453 481 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2742 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Shadowforge Warrior
-- mangos: 300 
-- 1.13: 327 354 396 475 
-- 1.14: 414 
-- 2.5: 311 312 324 326 341 344 352 378 406 430 441 444 460 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2743 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Ambassador Infernus
-- mangos: 600 
-- 2.5: 329 329 336 
UPDATE `creature` SET `spawntimesecsmin`=330, `spawntimesecsmax`=330 WHERE 2745 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Burning Exile
-- mangos: 400 
-- 1.13: 303 313 340 381 432 459
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2760 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Cresting Exile
-- mangos: 400 
-- 1.13: 327 349 366 385 398 420 430 434 450 454 472
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2761 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Thundering Exile
-- mangos: 400 
-- 1.13: 301 307 315 319 327 341 348 349 368 370 376 384 389 393 395 396 402 405 407 416 421 424 432 442 444 454 459 461 463 478 481
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2762 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Korin Fel
-- mangos: 400 
-- 2.5: 435 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2772 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Or'Kalar
-- mangos: 400 
-- 1.13: 373 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2773 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Enraged Rock Elemental
-- mangos: 300 
-- 1.13: 305 316 318 321 322 324 325 340 342 343 350 353 355 378 382 384 387 389 390 396 397 398 407 408 408 409 413 415 417 424 433 439 444 469 478 485 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2791 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Deneb Walker
-- mangos: 400 
-- 1.13: 396 
-- 2.5: 474 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2805 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Slagg
-- mangos: 400 
-- 2.5: 403 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2818 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Giant Buzzard
-- mangos: 300 
-- 2.5: 350 384 407
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2831 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Stonevault Bonesnapper
-- mangos: 300 
-- 1.13: 301 305 306 307 318 330 331 334 351 367 397 400 460 474 
-- 1.14: 307 321 322 328 375 379 379 386 390 396 396 397 417 425 425 429 432 453 456 461 472
-- 2.5: 324 340 349 353 370 377 415 469 472 485
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2893 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Stonevault Shaman
-- mangos: 300 
-- 1.13: 400 414 431 434 
-- 1.14: 330 331 366 388 392 394 409 454 455 455 473 
-- 2.5: 337 363 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2894 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Hammertoe Grez
-- mangos: 300 
-- 1.13: 471 
-- 2.5: 479 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2909 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Archaeologist Flagongut
-- mangos: 300 
-- 2.5: 370 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2911 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Snake
-- mangos: 300 
-- 1.13: 384 
-- 1.14: 353 362 378 464 
-- 2.5: 314 323 326 326 339 351 357 358 377 382 386 399 400 407 412 414 421 439 458 475 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2914 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Magregan Deepshadow
-- mangos: 300 
-- 1.13: 1611 
-- 2.5: 1824 
UPDATE `creature` SET `spawntimesecsmin`=1500, `spawntimesecsmax`=1800 WHERE 2932 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Murdaloc
-- mangos: 300 
-- 1.14: 363 467 
-- 2.5: 428 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2945 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Palemane Tanner
-- mangos: 375 
-- 1.13: 324 337 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2949 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Palemane Skinner
-- mangos: 375 
-- 1.13: 401
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2950 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Palemane Poacher
-- mangos: 375 
-- 1.13: 400 406 412 414 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2951 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Bristleback Quilboar
-- mangos: 375 
-- 1.13: 182 
-- 1.14: 181 183
UPDATE `creature` SET `spawntimesecsmin`=180, `spawntimesecsmax`=180 WHERE 2952 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Bristleback Shaman
-- mangos: 375 
-- 1.13: 185 
UPDATE `creature` SET `spawntimesecsmin`=180, `spawntimesecsmax`=180 WHERE 2953 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Bristleback Battleboar
-- mangos: 375 
-- 1.14: 185 186 
UPDATE `creature` SET `spawntimesecsmin`=180, `spawntimesecsmax`=180 WHERE 2954 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Plainstrider
-- mangos: 233 
-- 1.13: 183 
UPDATE `creature` SET `spawntimesecsmin`=180, `spawntimesecsmax`=180 WHERE 2955 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Battleboar
-- mangos: 233 
-- 1.13: 181 184 185 
UPDATE `creature` SET `spawntimesecsmin`=180, `spawntimesecsmax`=180 WHERE 2966 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Venture Co. Worker
-- mangos: 375 
-- 1.14: 402 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2978 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Venture Co. Supervisor
-- mangos: 375 
-- 1.14: 330 414 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2979 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Eyahn Eagletalon
-- mangos: 375 
-- 2.5: 389 417 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2987 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Karn Stonehoof
-- mangos: 250 
-- 2.5: 394 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2998 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Taur Stonehoof
-- mangos: 250 
-- 2.5: 338 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 2999 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Brek Stonehoof
-- mangos: 250 
-- 2.5: 423 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3001 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Kurm Stonehoof
-- mangos: 250 
-- 2.5: 355 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3002 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Nata Dawnstrider
-- mangos: 250 
-- 2.5: 420 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3012 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Sunn Ragetotem
-- mangos: 250 
-- 2.5: 348 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3022 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Sura Wildmane
-- mangos: 250 
-- 2.5: 443 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3023 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Tah Winterhoof
-- mangos: 250 
-- 2.5: 467 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3024 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Kaga Mistrunner
-- mangos: 250 
-- 2.5: 389 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3025 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Aska Mistrunner
-- mangos: 250 
-- 2.5: 399 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3026 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Naal Mistrunner
-- mangos: 250 
-- 2.5: 367 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3027 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Kah Mistrunner
-- mangos: 250 
-- 2.5: 325 409 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3028 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Sewa Mistrunner
-- mangos: 250 
-- 2.5: 332 387 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3029 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Sheza Wildmane
-- mangos: 250 
-- 2.5: 445 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3037 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Urek Thunderhorn
-- mangos: 250 
-- 2.5: 351 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3040 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Malakai Cross
-- mangos: 250 
-- 2.5: 338 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3045 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Father Cobb
-- mangos: 250 
-- 2.5: 439 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3046 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Thurston Xane
-- mangos: 250 
-- 2.5: 479 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3049 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Zarlman Two-Moons
-- mangos: 375 
-- 2.5: 318 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3054 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Krang Stonehoof
-- mangos: 375 
-- 1.13: 419 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3063 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Varg Windwhisper
-- mangos: 375 
-- 2.5: 322 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3079 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Bluffwatcher
-- mangos: 300 
-- 2.5: 303 304 310 317 317 331 348 371 399 417 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3084 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Unseen
-- mangos: 300 
-- 1.14: 442 455 
-- 2.5: 379 421 428 434 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3094 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Mottled Boar
-- mangos: 180 
-- 1.13: 181 182 
-- 1.14: 182 183 183
UPDATE `creature` SET `spawntimesecsmin`=180, `spawntimesecsmax`=180 WHERE 3098 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Felstalker
-- mangos: 300 
-- 1.13: 181 183 
-- 1.14: 183 184 184 186
UPDATE `creature` SET `spawntimesecsmin`=180, `spawntimesecsmax`=180 WHERE 3102 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Dustwind Harpy
-- mangos: 300 
-- 1.13: 398 473 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3115 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Kolkar Drudge
-- mangos: 300 
-- 1.14: 365 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3119 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Durotar Tiger
-- mangos: 300 
-- 1.13: 436 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3121 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Bloodtalon Taillasher
-- mangos: 300 
-- 1.13: 372 
-- 2.5: 374 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3122 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Scorpid Worker
-- mangos: 300 
-- 1.14: 181 184 
-- 2.5: 177 184
UPDATE `creature` SET `spawntimesecsmin`=180, `spawntimesecsmax`=180 WHERE 3124 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Clattering Scorpid
-- mangos: 300 
-- 2.5: 319 338 340 344 347 388 401 408 421 441 459 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3125 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Wuark
-- mangos: 300 
-- 2.5: 426 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3167 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Kaplak
-- mangos: 300 
-- 2.5: 422 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3170 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Mishiki
-- mangos: 300 
-- 2.5: 436 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3185 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- K'waii
-- mangos: 300 
-- 2.5: 468 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3186 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Tai'tasi
-- mangos: 300 
-- 2.5: 372 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3187 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Lieutenant Benedict
-- mangos: 240 
-- 1.13: 63 
-- 1.14: 63 
-- 2.5: 62 
UPDATE `creature` SET `spawntimesecsmin`=60, `spawntimesecsmax`=60 WHERE 3192 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Fizzle Darkstorm
-- mangos: 300 
-- 1.14: 61 
UPDATE `creature` SET `spawntimesecsmin`=60, `spawntimesecsmax`=60 WHERE 3203 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Corrupted Scorpid
-- mangos: 300 
-- 1.13: 332 445 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3226 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Silithid Grub
-- mangos: 413 
-- 2.5: 392 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3251 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Sunscale Screecher
-- mangos: 413 
-- 1.13: 398 418 460
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3255 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Sunscale Scytheclaw
-- mangos: 413 
-- 1.13: 334 409 
-- 1.14: 336 351 362 367 384 385 419 419 425
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3256 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Bristleback Thornweaver
-- mangos: 413 
-- 1.14: 310 311 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3261 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Bristleback Geomancer
-- mangos: 413 
-- 1.13: 424 
-- 1.14: 386 388 403 412 418 471 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3263 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Kolkar Pack Runner
-- mangos: 240 
-- 1.14: 365 425 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3274 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Kolkar Marauder
-- mangos: 240 25000 
-- 1.14: 323 395 396 438 444
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3275 IN (id, id2, id3, id4, id5) && `patch_max`=10 && `spawntimesecsmin`=240;


-- Witchwing Slayer
-- mangos: 413 
-- 1.14: 369 430 
-- 2.5: 319 380 426
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3278 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Venture Co. Mercenary
-- mangos: 413 
-- 1.14: 320 351 371 378 386 415 481 484
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3282 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Venture Co. Enforcer
-- mangos: 413 
-- 1.14: 333 392 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3283 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Venture Co. Drudger
-- mangos: 413 
-- 1.13: 309 
-- 1.14: 306 310 316 322 332 341 352 360 392 407 415 418 422 424 428 430 469 469 471
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3284 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Venture Co. Overseer
-- mangos: 413 
-- 1.14: 347 387 418 478 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3286 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Orgrimmar Grunt
-- mangos: 300 
-- 2.5: 312 380 451 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3296 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Sen'jin Watcher
-- mangos: 300 
-- 2.5: 348 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3297 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Master Vornal
-- mangos: 300 
-- 2.5: 466 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3304 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Grisha
-- mangos: 900 
-- 1.13: 401 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3305 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Horthus
-- mangos: 25 
-- 2.5: 382 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3323 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Lumak
-- mangos: 300 
-- 2.5: 364 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3332 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Kardris Dreamseeker
-- mangos: 300 
-- 2.5: 452 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3344 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Kor'geld
-- mangos: 300 
-- 2.5: 316 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3348 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Saru Steelfury
-- mangos: 300 
-- 2.5: 374 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3355 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Sumi
-- mangos: 300 
-- 2.5: 365 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3356 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Bael'dun Excavator
-- mangos: 413 
-- 1.13: 304 305 305 309 314 320 326 330 332 334 342 343 350 354 358 363 364 366 374 385 389 392 400 401 402 403 409 419 420 421 424 425 428 429 430 436 436 446 450 450 452 465 471 474
-- 1.14: 333 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3374 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Bael'dun Foreman
-- mangos: 413 
-- 1.13: 354 354 368 375 394 429 471
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3375 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Bael'dun Soldier
-- mangos: 413 
-- 1.13: 315 322 361 419 
-- 1.14: 314 330 340 430 437 467 475 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3376 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Bael'dun Rifleman
-- mangos: 413 
-- 1.13: 370 377 382 453 463 469 
-- 1.14: 342 401 403 451 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3377 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Bael'dun Officer
-- mangos: 413 
-- 1.13: 476 
-- 1.14: 390 421 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3378 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Southsea Brigand
-- mangos: 413 
-- 1.13: 336 
-- 2.5: 415 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3381 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Southsea Cannoneer
-- mangos: 413 
-- 2.5: 395 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3382 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Theramore Marine
-- mangos: 300 
-- 1.13: 314 356 377 
-- 1.14: 314 318 319 333 352 355 358 361 374 386 418 439 441 455 
-- 2.5: 453 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3385 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Theramore Preserver
-- mangos: 300 
-- 1.14: 377 393 400 464 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3386 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Apothecary Helbrim
-- mangos: 413 
-- 2.5: 315 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3390 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Captain Fairmount
-- mangos: 413 
-- 1.14: 310 463 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3393 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Zendo'jian
-- mangos: 300 
-- 2.5: 435 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3409 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Apothecary Zamah
-- mangos: 375 
-- 2.5: 361 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3419 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Savannah Prowler
-- mangos: 413 
-- 1.13: 306 308 322 329 332 341 351 352 355 379 383 384 386 388 389 399 401 404 404 408 425 428 430 433 433 433 434 439 440 445 447 447 447 449 451 452 453 455 459 463 472 473 483 483
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3425 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Korran
-- mangos: 413 
-- 2.5: 308 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3428 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Grenthar
-- mangos: 413 
-- 2.5: 402 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3431 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Mankrik
-- mangos: 413 
-- 1.13: 359 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3432 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Kreenig Snarlsnout
-- mangos: 413 
-- 1.14: 483 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3438 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Wizzlecrank's Shredder
-- mangos: 413 
-- 1.14: 352 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3439 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Melor Stonehoof
-- mangos: 250 
-- 2.5: 325 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3441 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Razormane Warfrenzy
-- mangos: 413 
-- 1.13: 443 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3459 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Gazrog
-- mangos: 413 
-- 2.5: 432 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3464 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Gilthares Firebough
-- mangos: 413 
-- 1.14: 400 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3465 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Ancient of War
-- mangos: 300 
-- 2.5: 378 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3469 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Hraq
-- mangos: 413 
-- 2.5: 356 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3477 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Traugh
-- mangos: 275 
-- 2.5: 343 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3478 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Barg
-- mangos: 413 
-- 2.5: 417 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3481 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Tari'qa
-- mangos: 413 
-- 2.5: 437 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3482 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Jahan Hawkwing
-- mangos: 413 
-- 2.5: 376 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3483 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Uthrok
-- mangos: 413 
-- 2.5: 391 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3488 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Hula'mahi
-- mangos: 275 
-- 2.5: 326 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3490 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Horde Guard
-- mangos: 275 
-- 1.13: 354 355 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3501 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Rellian Greenspyre
-- mangos: 300 
-- 2.5: 337 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3517 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Pyrewood Armorer
-- mangos: 300 500 
-- 1.13: 433 
-- 2.5: 345 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3528 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Pyrewood Leatherworker
-- mangos: 300 500 
-- 1.13: 435 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3532 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Ott
-- mangos: 300 
-- 2.5: 416 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3539 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Claude Erksine
-- mangos: 300 
-- 2.5: 365 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3545 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Selina Weston
-- mangos: 300 
-- 1.14: 303 404 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3548 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Alexandre Lefevre
-- mangos: 413 
-- 2.5: 311 382 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3552 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Andrea Boynton
-- mangos: 413 
-- 2.5: 350 471 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3554 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Johan Focht
-- mangos: 413 
-- 2.5: 482 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3555 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Dalaran Brewmaster
-- mangos: 413 
-- 2.5: 345 410 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3577 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Dalaran Miner
-- mangos: 413 
-- 1.13: 347 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3578 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Harruk
-- mangos: 300 
-- 2.5: 369 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3620 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Jenn Langston
-- mangos: 555 
-- 1.14: 325 477 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3626 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Erich Lohan
-- mangos: 270 
-- 1.14: 461 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3627 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Sentinel Elissa Starbreeze
-- mangos: 413 
-- 2.5: 352 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3657 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Delgren the Purifier
-- mangos: 10 
-- 1.13: 31 
-- 2.5: 39 
UPDATE `creature` SET `spawntimesecsmin`=30, `spawntimesecsmax`=40 WHERE 3663 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Terenthis
-- mangos: 413 
-- 2.5: 397 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3693 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Alanndarian Nightsong
-- mangos: 413 
-- 2.5: 334 341 412 425 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3702 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Wrathtail Myrmidon
-- mangos: 300 
-- 1.13: 414 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3711 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Wrathtail Razortail
-- mangos: 300 
-- 1.13: 427 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3712 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Wrathtail Wave Rider
-- mangos: 300 
-- 1.13: 424 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3713 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Wrathtail Sea Witch
-- mangos: 300 
-- 1.13: 398 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3715 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Dark Strand Cultist
-- mangos: 300 
-- 1.13: 338 362 365 441 469
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3725 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Dark Strand Enforcer
-- mangos: 300 
-- 1.13: 319 322 376 436 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3727 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Forsaken Thug
-- mangos: 300 
-- 2.5: 336 339 362 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3734 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Saltspittle Puddlejumper
-- mangos: 300 
-- 1.13: 388 419 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3737 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Foulweald Warrior
-- mangos: 300 
-- 1.13: 307 337 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=360 WHERE 3743 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Xavian Rogue
-- mangos: 300 
-- 1.14: 317 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=360 WHERE 3752 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Felmusk Satyr
-- mangos: 300 
-- 1.13: 370 414 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3758 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Felmusk Rogue
-- mangos: 300 
-- 1.13: 360 423 472
UPDATE `creature` SET `spawntimesecsmin`=360, `spawntimesecsmax`=480 WHERE 3759 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Bleakheart Satyr
-- mangos: 300 
-- 1.13: 384 399 453
-- 1.14: 309 337 406 410 
-- 2.5: 334 370 393 422 432 436 446 459
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3765 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Bleakheart Trickster
-- mangos: 300 
-- 1.13: 317 330 362 380 404 413 429
-- 1.14: 421 439
-- 2.5: 325 331 344 344 437 445 465 469 474 479 480
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3767 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Shadethicket Stone Mover
-- mangos: 300 
-- 1.13: 466 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3782 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Terrowulf Shadow Weaver
-- mangos: 300 
-- 1.13: 408 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3791 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Cenarion Protector
-- mangos: 300 
-- 2.5: 317 335 425 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3797 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Severed Keeper
-- mangos: 300 
-- 1.13: 383 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3803 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Crazed Ancient
-- mangos: 300 
-- 1.13: 441 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3834 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Jhawna Oatwind
-- mangos: 375 
-- 2.5: 431 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3884 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Befouled Water Elemental
-- mangos: 300 
-- 1.13: 311 334 360 364 377 382 402 421 431 434 443 456 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3917 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Thistlefur Ursa
-- mangos: 300 
-- 1.13: 321 402 406 444 444 445 
-- 1.14: 315 316 331 331 337 351 392 414 424 460 486 
-- 2.5: 426 469 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3921 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Thistlefur Totemic
-- mangos: 300 
-- 1.13: 369 392 453 
-- 1.14: 324 402
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3922 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Thistlefur Den Watcher
-- mangos: 300 
-- 1.14: 395 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3923 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Bloodtooth Guard
-- mangos: 300 
-- 1.13: 315 383 432 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3932 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Innkeeper Boorand Plainswind
-- mangos: 275 
-- 2.5: 411 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3934 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Ruuzel
-- mangos: 300 
-- 1.13: 340 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3943 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Honni Goldenoat
-- mangos: 300 
-- 2.5: 335 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3948 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Nantar
-- mangos: 300 
-- 1.14: 325 444 470 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3959 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Aayndia Floralwind
-- mangos: 300 
-- 1.14: 402 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3967 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Sage Truthseeker
-- mangos: 250 
-- 2.5: 422 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3978 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Venture Co. Logger
-- mangos: 300 
-- 1.14: 416 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3989 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Venture Co. Engineer
-- mangos: 300 
-- 1.14: 375 375 
UPDATE `creature` SET `spawntimesecsmin`=375, `spawntimesecsmax`=375 WHERE 3992 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Venture Co. Machine Smith
-- mangos: 300 
-- 1.14: 367 440 463 465 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3993 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Windshear Digger
-- mangos: 300 
-- 1.14: 316 326 390 400 467 
-- 2.5: 305 307 310 312 323 338 347 353 369 377 384 385 394 399 403 406 410 419 435 451 461 470 472 476 483 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 3999 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Deepmoss Creeper
-- mangos: 300 
-- 1.13: 360 
-- 1.14: 308 330 344 359 367 373 374 388 460 464 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4005 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Deepmoss Venomspitter
-- mangos: 300 
-- 1.13: 327 360 389 405 407 
-- 1.14: 405 
-- 2.5: 304 311 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=420 WHERE 4007 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Great Courser
-- mangos: 300 
-- 1.14: 340 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4019 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Bloodfury Harpy
-- mangos: 300 
-- 1.13: 411 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4022 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Scorched Basilisk
-- mangos: 300 
-- 1.13: 395 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4041 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Blackened Basilisk
-- mangos: 300 
-- 1.13: 424 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4044 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Zor Lonetree
-- mangos: 300 
-- 2.5: 437 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4047 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Cenarion Druid
-- mangos: 300 
-- 2.5: 849 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 4052 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Mirkfallon Keeper
-- mangos: 300 
-- 1.14: 816 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 4056 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Dark Iron Bombardier
-- mangos: 400 
-- 1.13: 372 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4062 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Blackrock Scout
-- mangos: 900 
-- 1.14: 814 826 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 4064 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Blackrock Sentry
-- mangos: 900 
-- 1.14: 724 727 749 753 776 790 798 803 811 823 824 830 833 833 838 843 843 848 851 864 889 924 946 970
-- 2.5: 841 855 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 4065 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Prisoner of Jin'Zil
-- mangos: 30 
-- 1.13: 22 22 22 22 22 22 24 24 24 
-- 1.14: 24 24 24 24 24 24 
UPDATE `creature` SET `spawntimesecsmin`=20, `spawntimesecsmax`=25 WHERE 4072 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Roach
-- mangos: 300 
-- 1.13: 312 314 335 347 375 376 423 432 480 
-- 1.14: 313 316 410 412 441 457 
-- 2.5: 358 376 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4076 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Lariia
-- mangos: 300 
-- 2.5: 484 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4092 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Galak Wrangler
-- mangos: 300 
-- 1.13: 478 484 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4093 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Galak Mauler
-- mangos: 300 
-- 1.13: 478 
-- 1.14: 428 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4095 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Highperch Wyvern
-- mangos: 300 
-- 1.14: 380 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4107 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Highperch Consort
-- mangos: 300 
-- 2.5: 422 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4109 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Silithid Hive Drone
-- mangos: 300 
-- 1.13: 308 419 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4133 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Scorpid Reaver
-- mangos: 300 
-- 1.13: 329 348
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=360 WHERE 4140 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Me'lynn
-- mangos: 300 
-- 2.5: 451 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4159 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Ainethil
-- mangos: 300 
-- 2.5: 337 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4160 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Elynna
-- mangos: 300 
-- 2.5: 307 382 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4168 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Valdaron
-- mangos: 413 
-- 2.5: 465 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4189 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Grondal Moonbreeze
-- mangos: 413 
-- 2.5: 427 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4193 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Dannelor
-- mangos: 300 
-- 2.5: 421 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4211 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Taladan
-- mangos: 300 
-- 2.5: 394 442 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4213 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Cyroen
-- mangos: 300 
-- 2.5: 434 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4220 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Ulthir
-- mangos: 300 
-- 2.5: 351 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4226 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Vaean
-- mangos: 300 
-- 2.5: 480 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4228 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Mythrin'dir
-- mangos: 300 
-- 2.5: 345 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4229 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Golnir Bouldertoe
-- mangos: 310 
-- 2.5: 449 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4256 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Darnassus Sentinel
-- mangos: 300 
-- 2.5: 299 338 429 478
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4262 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Keeper Ordanus
-- mangos: 300 
-- 2.5: 483 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4273 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Scarlet Sentry
-- mangos: 300 7200 
-- 1.13: 743 949 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 4283 IN (id, id2, id3, id4, id5) && `patch_max`=10 && `map`=0;


-- Scarlet Disciple
-- mangos: 300 
-- 1.13: 728 860 876 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 4285 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Kolkar Packhound
-- mangos: 413 
-- 1.14: 345 413 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4316 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Searing Whelp
-- mangos: 360 
-- 1.13: 823 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 4324 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Firemane Scalebane
-- mangos: 360 
-- 1.13: 726 768 781 912 926 957 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 4328 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Firemane Scout
-- mangos: 360 
-- 1.13: 798 849 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 4329 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Firemane Flamecaller
-- mangos: 360 
-- 1.13: 755 765 796
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 4334 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Mirefin Puddlejumper
-- mangos: 120 360 
-- 1.13: 423 
-- 1.14: 310 317 327 327 335 336 338 350 358 363 364 365 365 366 374 380 392 394 394 406 411 436 440 465 467 485 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4358 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Mirefin Murloc
-- mangos: 360 
-- 1.13: 350 407 424 
-- 1.14: 308 312 320 327 327 329 329 341 342 346 355 373 376 376 382 386 397 409 416 417 433 452 466 468 474
-- 2.5: 399 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4359 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Mirefin Warrior
-- mangos: 360 
-- 1.13: 427
-- 1.14: 317 333 361 367 373 377 378 382 425 434 470 470
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4360 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Mirefin Muckdweller
-- mangos: 360 
-- 1.13: 337 362 407 
-- 1.14: 320 417 
-- 2.5: 303 351 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4361 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Mirefin Coastrunner
-- mangos: 360 
-- 1.13: 320 334 378 417 
-- 1.14: 336 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4362 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Mirefin Oracle
-- mangos: 360 
-- 1.13: 375
-- 1.14: 326 336 359 366 381 382 384 419 425 428 469 471 472 475 
-- 2.5: 361 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4363 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Strashaz Myrmidon
-- mangos: 1200 5400 
-- 1.13: 891 940 
-- 1.14: 754 
-- 2.5: 743 937 938 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 4368 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Strashaz Sorceress
-- mangos: 1200 
-- 1.13: 728 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 4370 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Darkmist Spider
-- mangos: 360 
-- 1.14: 316 345 391 415 419 471 472 477
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4376 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Darkmist Lurker
-- mangos: 120 360 
-- 1.14: 324 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4377 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Darkmist Recluse
-- mangos: 360 
-- 1.13: 323 325 
-- 1.14: 387 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4378 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Darnassian Protector
-- mangos: 300 
-- 2.5: 465 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4423 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Blackrock Hunter
-- mangos: 900 
-- 1.14: 779 817 830 872 878 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 4462 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Blackrock Summoner
-- mangos: 300 
-- 1.13: 315 399 445 
-- 1.14: 18 160 324 332 343 366 408 
-- 2.5: 412 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4463 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Blackrock Gladiator
-- mangos: 900 
-- 1.14: 813 874 909 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 4464 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Vilebranch Scalper
-- mangos: 350 
-- 1.13: 302 313 319 323 
-- 2.5: 460 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4466 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Vilebranch Soothsayer
-- mangos: 350 
-- 1.13: 305 307 357 357 377 428 473 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4467 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Rotting Cadaver
-- mangos: 315 
-- 1.13: 427 459 473 
-- 1.14: 332
-- 2.5: 375 387 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4474 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Blighted Zombie
-- mangos: 315 
-- 1.13: 320 331 340 
-- 1.14: 424 
-- 2.5: 354 354 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4475 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Parqual Fintallas
-- mangos: 300 
-- 1.13: 416 
-- 1.14: 329 465 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4488 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Scarlet Avenger
-- mangos: 315 
-- 1.13: 394 452 456 464 468 
-- 2.5: 326 394 448 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4493 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Scarlet Spellbinder
-- mangos: 315 
-- 1.13: 762 789 886 930 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 4494 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Bloodsail Deckhand
-- mangos: 300 
-- 1.13: 332 357 367 381 434 480 
-- 1.14: 301 318 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4505 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Bloodsail Swabby
-- mangos: 300 
-- 1.13: 348 401 419 427 436
-- 1.14: 376 387 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4506 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Doctor Marsh
-- mangos: 275 
-- 2.5: 451 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4609 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Algernon
-- mangos: 275 
-- 2.5: 332 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4610 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Doctor Herbert Halsey
-- mangos: 300 
-- 2.5: 323 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4611 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Booty Bay Bruiser
-- mangos: 300 
-- 1.14: 483 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4624 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Kolkar Mauler
-- mangos: 300 
-- 1.13: 445 460 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4634 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Kolkar Windchaser
-- mangos: 300 
-- 1.13: 340 399 
-- 1.14: 445 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4635 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Magram Wrangler
-- mangos: 300 
-- 1.14: 365 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4640 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Magram Stormer
-- mangos: 300 
-- 1.14: 390 394
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4642 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Magram Marauder
-- mangos: 300 
-- 1.14: 340 372 403
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4644 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Gelkis Outrunner
-- mangos: 300 
-- 1.13: 343 422 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4646 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Gelkis Stamper
-- mangos: 300 
-- 1.13: 309 434
-- 1.14: 462 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4648 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Burning Blade Augur
-- mangos: 300 
-- 1.13: 468 
-- 1.14: 357 457 482 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4663 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Burning Blade Reaver
-- mangos: 300 
-- 1.13: 320 346 347 348 371 379 389 414 417 443 455 
-- 1.14: 323 344 351 362 377 387 388 399 414 431 479
-- 2.5: 432 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4664 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Burning Blade Adept
-- mangos: 300 
-- 1.13: 315 331 357 359 367 380 392 406 459 461 464 
-- 1.14: 305 324 366 423 432 
-- 2.5: 339 371 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4665 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Burning Blade Felsworn
-- mangos: 300 
-- 1.13: 305 308 310 310 312 316 316 319 324 327 331 337 340 343 351 398 402 414 435 446 455 459 461 465 470 483
-- 1.14: 306 309 316 324 344 344 348 349 354 357 361 363 365 376 380 400 404 412 429 476 833 2562 2947 
-- 2.5: 387 403 435 437 451 468 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4666 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Hatefury Betrayer
-- mangos: 300 
-- 1.14: 330 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4673 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Mana Eater
-- mangos: 300 
-- 1.14: 335 345 361 385 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4678 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Doomwarder Captain
-- mangos: 300 
-- 1.14: 324 371 440 
-- 2.5: 364 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4680 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Nether Sorceress
-- mangos: 300 
-- 1.14: 388
-- 2.5: 340 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4684 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Dread Ripper
-- mangos: 300 
-- 1.13: 440 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4694 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Aged Kodo
-- mangos: 180 300 
-- 1.14: 382 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4700 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Slitherblade Sorceress
-- mangos: 300 
-- 1.13: 445 
-- 2.5: 393 400 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4712 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Slitherblade Warrior
-- mangos: 300 
-- 1.13: 480 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4713 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Slitherblade Myrmidon
-- mangos: 300 
-- 1.13: 345 465 479 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4714 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Slitherblade Razortail
-- mangos: 300 
-- 1.13: 338 392 406 407 463 465 483
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4715 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Slitherblade Tidehunter
-- mangos: 300 
-- 1.13: 382 418 421
-- 1.14: 409 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4716 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Slitherblade Oracle
-- mangos: 300 
-- 1.13: 451 
-- 2.5: 381 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4718 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Slitherblade Sea Witch
-- mangos: 300 
-- 1.13: 335 445 477 480
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4719 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Foreman Cozzle
-- mangos: 300 
-- 1.13: 399 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4723 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Lelanai
-- mangos: 300 
-- 2.5: 404 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4730 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Zachariah Post
-- mangos: 300 
-- 1.14: 479 
-- 2.5: 380 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4731 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Jartsam
-- mangos: 300 
-- 2.5: 407 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4753 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Velma Warnam
-- mangos: 300 
-- 1.14: 335 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4773 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Truk Wildbeard
-- mangos: 350 
-- 2.5: 308 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4782 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Morgan Stern
-- mangos: 360 
-- 2.5: 408 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4794 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Shadowforge Surveyor
-- mangos: 300 
-- 1.13: 1803 1819
-- 2.5: 1802 1803 1804 1805 1805 
UPDATE `creature` SET `spawntimesecsmin`=1800, `spawntimesecsmax`=1800 WHERE 4844 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Shadowforge Ruffian
-- mangos: 300 
-- 1.13: 1803 
-- 2.5: 1804 1804 1804 1806 
UPDATE `creature` SET `spawntimesecsmin`=1800, `spawntimesecsmax`=1800 WHERE 4845 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Shadowforge Digger
-- mangos: 300 
-- 1.13: 1782 1800 1801 1803 1803 1804 1804 1804 1814
-- 2.5: 1801 1801 1801 1802 1804 1804 1804 1804 1804 1804 1805 1805 1805 1805 1806 1806 
UPDATE `creature` SET `spawntimesecsmin`=1800, `spawntimesecsmax`=1800 WHERE 4846 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Obsidian Golem
-- mangos: 300 
-- 2.5: 1804 
UPDATE `creature` SET `spawntimesecsmin`=1800, `spawntimesecsmax`=1800 WHERE 4872 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Torq Ironblast
-- mangos: 360 
-- 2.5: 401 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4889 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Piter Verance
-- mangos: 360 
-- 2.5: 390 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4890 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Dwane Wertle
-- mangos: 540 
-- 2.5: 317 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4891 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Craig Nollward
-- mangos: 360 
-- 2.5: 448 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4894 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Mikal Pierce
-- mangos: 360 
-- 2.5: 431 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4902 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Guard Byron
-- mangos: 360 
-- 2.5: 447 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4921 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Combat Master Criton
-- mangos: 360 
-- 2.5: 444 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4924 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Adjutant Tesoran
-- mangos: 360 
-- 2.5: 316 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4948 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Dashel Stonefist
-- mangos: 270 
-- 2.5: 63 
UPDATE `creature` SET `spawntimesecsmin`=60, `spawntimesecsmax`=60 WHERE 4961 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Mikhail
-- mangos: 300 
-- 2.5: 355 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4963 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Theramore Guard
-- mangos: 360 
-- 2.5: 352 407 420
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 4979 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Stockade Guard
-- mangos: 540 
-- 2.5: 186 191 198 205 206 207 209 233 235 235 
UPDATE `creature` SET `spawntimesecsmin`=180, `spawntimesecsmax`=240 WHERE 4995 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Injured Stockade Guard
-- mangos: 540 
-- 2.5: 186 196 224 228 230 231 241 
UPDATE `creature` SET `spawntimesecsmin`=180, `spawntimesecsmax`=240 WHERE 4996 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Nurse Lillian
-- mangos: 310 
-- 2.5: 210 
UPDATE `creature` SET `spawntimesecsmin`=180, `spawntimesecsmax`=240 WHERE 5042 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Edward Remington
-- mangos: 300 
-- 2.5: 454 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5052 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Krumn
-- mangos: 250 
-- 2.5: 424 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5054 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Connor Rivers
-- mangos: 600 
-- 1.14: 434 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5081 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Clerk Lendry
-- mangos: 540 
-- 2.5: 331 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5083 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Fimble Finespindle
-- mangos: 310 
-- 2.5: 381 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5127 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Reyna Stonebranch
-- mangos: 310 
-- 2.5: 402 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5137 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Gwina Stonebranch
-- mangos: 310 
-- 2.5: 402 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5138 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Maeva Snowbraid
-- mangos: 310 
-- 2.5: 348 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5156 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Daryl Riknussun
-- mangos: 310 
-- 2.5: 321 327 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5159 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Emrul Riknussun
-- mangos: 310 
-- 2.5: 384 442 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5160 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Merill Pleasance
-- mangos: 300 
-- 2.5: 425 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5190 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Shalumon
-- mangos: 300 
-- 2.5: 472 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5191 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Medic Tamberlyn
-- mangos: 360 
-- 2.5: 306 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5199 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Medic Helaina
-- mangos: 360 
-- 2.5: 339 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5200 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Gordunni Brute
-- mangos: 300 
-- 1.13: 458 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5232 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Gordunni Mauler
-- mangos: 300 
-- 1.13: 469 
-- 1.14: 392 
-- 2.5: 437 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5234 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Gordunni Shaman
-- mangos: 300 
-- 1.13: 376 444 
-- 1.14: 411 416 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5236 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Gordunni Warlock
-- mangos: 300 
-- 1.14: 350 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5240 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Groddoc Thunderer
-- mangos: 300 
-- 1.13: 319 335 375 376 395 421
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5262 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Ironfur Patriarch
-- mangos: 300 
-- 1.13: 303 376 419 427 475
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5274 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Sprite Darter
-- mangos: 300 
-- 1.13: 342 419 429 447 457
-- 1.14: 354 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5278 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Longtooth Runner
-- mangos: 300 
-- 1.13: 314 316 318 326 334 336 337 340 348 354 358 361 382 387 407 420 429 436 437 468
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5286 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Rabid Longtooth
-- mangos: 300 
-- 1.13: 344 382 383 463 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5288 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Feral Scar Yeti
-- mangos: 300 
-- 2.5: 358 408 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5292 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Hulking Feral Scar
-- mangos: 300 
-- 2.5: 332 346 373 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5293 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Rage Scar Yeti
-- mangos: 300 
-- 1.13: 392 437 479 
-- 1.14: 318 329 343 345 369 391 422 465 471 474 
-- 2.5: 333 420 433 444 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5296 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Elder Rage Scar
-- mangos: 300 
-- 1.13: 329 352 372 450 
-- 1.14: 335 352 448 479 
-- 2.5: 374 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5297 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Ferocious Rage Scar
-- mangos: 300 
-- 1.13: 362 446 465 468 834 933 
-- 1.14: 310 315 318 319 326 351 379 382 389 429 447 462 471 476 482 483
-- 2.5: 420 422 436 437
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5299 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Frayfeather Hippogryph
-- mangos: 300 
-- 1.13: 313 374 399 416 419 475
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5300 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Frayfeather Stagwing
-- mangos: 300 
-- 2.5: 337
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5304 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Frayfeather Skystormer
-- mangos: 300 
-- 2.5: 399 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5305 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Phantim
-- mangos: 5400 
-- 1.13: 2400 
UPDATE `creature` SET `spawntimesecsmin`=2400, `spawntimesecsmax`=2400 WHERE 5314 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Coast Crawl Snapclaw
-- mangos: 300 
-- 2.5: 322 407 422
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5327 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Coast Crawl Deepseer
-- mangos: 300 
-- 2.5: 316 432 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5328 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Hatecrest Warrior
-- mangos: 300 
-- 1.14: 354 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5331 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Hatecrest Serpent Guard
-- mangos: 300 
-- 2.5: 418 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5333 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Hatecrest Sorceress
-- mangos: 300 
-- 2.5: 428 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5336 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Shore Strider
-- mangos: 600 
-- 1.14: 334 388 440 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5359 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Ingo Woolybush
-- mangos: 360 
-- 2.5: 344 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5388 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Galen Goodward
-- mangos: 300 
-- 1.13: 92 
-- 1.14: 72 128 146 
UPDATE `creature` SET `spawntimesecsmin`=60, `spawntimesecsmax`=150 WHERE 5391 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Quartermaster Lungertz
-- mangos: 300 
-- 2.5: 369 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5393 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Neeka Bloodscar
-- mangos: 300 
-- 2.5: 360 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5394 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Infiltrator Marksen
-- mangos: 300 
-- 1.13: 33 33 
UPDATE `creature` SET `spawntimesecsmin`=33, `spawntimesecsmax`=33 WHERE 5416 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Glasshide Basilisk
-- mangos: 300 
-- 1.13: 333 436 480 
-- 1.14: 312 314 317 321 321 337 337 338 347 356 361 368 381 385 389 394 442 446 451 455 475 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5419 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Glasshide Gazer
-- mangos: 300 
-- 1.13: 356 367 
-- 1.14: 312 314 314 316 325 326 330 331 332 338 341 353 354 357 360 361 361 374 376 376 382 383 388 389 390 396 397 398 399 404 404 408 408 410 412 415 416 419 419 425 430 432 434 436 439 441 444 445 447 447 450 453 453 458 463 463 464 464 464 466 470 472 481 483 485
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5420 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Glasshide Petrifier
-- mangos: 300 
-- 1.13: 411 467 
-- 1.14: 312 315 351 406 425 434 449 464 481 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5421 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Scorpid Hunter
-- mangos: 300 
-- 1.13: 303 400 
-- 1.14: 306 359 401 414 414 442 444 452 464 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5422 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Scorpid Tail Lasher
-- mangos: 300 
-- 1.13: 305 
-- 1.14: 306 311 330 332 335 352 352 376 377 403 404 406 419 422 423 426 431 444 451 458 465 466 474 476
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5423 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Scorpid Dunestalker
-- mangos: 120 300 
-- 1.13: 372 398 410 
-- 1.14: 306 308 310 316 317 322 324 326 330 346 352 353 358 360 368 370 381 384 384 391 391 395 397 405 416 429 431 435 437 437 443 447 448 454 459 460 462 466 466 468 472 479 486
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5424 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Starving Blisterpaw
-- mangos: 300 
-- 1.13: 320 343 354 
-- 1.14: 346 355 362 400 408 450 465
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5425 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Blisterpaw Hyena
-- mangos: 300 
-- 1.14: 303 308 311 316 319 322 327 330 331 331 332 333 334 337 337 338 339 353 359 361 363 364 369 369 372 372 373 375 378 379 385 387 387 390 391 396 399 401 402 402 405 405 417 419 420 420 424 426 427 427 430 430 431 438 441 446 448 453 455 460 462 462 463 463 469 472 476 480
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5426 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Rabid Blisterpaw
-- mangos: 300 
-- 1.13: 409 
-- 1.14: 305 305 318 347 364 376 382 382 410 434 437 465 473 481
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5427 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Surf Glider
-- mangos: 300 
-- 1.14: 797 823 829 854 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 5431 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Hazzali Worker
-- mangos: 300 
-- 1.13: 329 
-- 1.14: 341 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5452 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Centipaar Wasp
-- mangos: 300 
-- 1.13: 416 424 
-- 1.14: 339 430 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5455 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Sea Elemental
-- mangos: 300 
-- 1.13: 463
-- 1.14: 316 355 391 432
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5461 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Sea Spray
-- mangos: 300 
-- 1.13: 367 387 449 468
-- 1.14: 306 356 376 435
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5462 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Dunemaul Ogre
-- mangos: 300 
-- 1.13: 388 393 
-- 1.14: 347 362 462 
-- 2.5: 317 380 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5471 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Dunemaul Enforcer
-- mangos: 300 
-- 1.13: 305 323 383 427 471 
-- 1.14: 470
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5472 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Thistleshrub Dew Collector
-- mangos: 300 
-- 1.13: 332 365 390 437 
-- 1.14: 319 
-- 2.5: 304 306 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5481 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Thistleshrub Rootshaper
-- mangos: 300 
-- 1.13: 347 396 
-- 1.14: 305 334 336 348 353
-- 2.5: 314 325 345
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5485 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Gnarled Thistleshrub
-- mangos: 300 
-- 1.13: 388 
-- 1.14: 317 
-- 2.5: 357 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5490 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Dar
-- mangos: 300 
-- 2.5: 333 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5591 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Ironforge Guard
-- mangos: 300 
-- 2.5: 304 306 382 404 414 466
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5595 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Khan Jehn
-- mangos: 300 
-- 1.14: 381 410 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5601 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Wastewander Rogue
-- mangos: 300 
-- 1.13: 464 
-- 1.14: 469
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5615 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Wastewander Thief
-- mangos: 300 
-- 1.13: 306 376 381 398 406 409 423 442 455 466
-- 1.14: 310 336 350 365 386 392 400 440 443 449 466 482
-- 2.5: 417 469 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5616 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Undercity Guardian
-- mangos: 300 
-- 1.13: 333 343 344 346 362 380 384 391 439 447 460 469 474 
-- 1.14: 304 305 306 306 309 309 311 313 313 316 318 318 319 319 322 322 323 323 324 324 326 328 329 331 333 336 336 338 339 340 341 342 343 345 346 354 355 356 361 363 363 368 369 372 375 375 382 383 384 385 387 387 387 389 391 392 394 396 397 398 401 402 402 404 404 405 406 407 407 408 412 412 419 419 423 424 424 424 424 426 426 428 431 436 437 437 438 441 443 443 445 446 446 446 447 448 451 452 453 455 455 455 455 457 460 463 468 472 474 477 477 480 481 481 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5624 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Vahlarriel Demonslayer
-- mangos: 300 
-- 2.5: 327 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5642 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Tyranis Malem
-- mangos: 300 
-- 1.14: 324 359 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5643 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Dalinda Malem
-- mangos: 300 
-- 1.13: 182 
UPDATE `creature` SET `spawntimesecsmin`=180, `spawntimesecsmax`=180 WHERE 5644 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Robert Gossom
-- mangos: 300 
-- 1.14: 448 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5655 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Andrew Hartwell
-- mangos: 300 
-- 1.14: 434 447 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5659 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Riley Walker
-- mangos: 300 
-- 2.5: 310 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5660 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Travist Bosk
-- mangos: 300 
-- 1.13: 437 
-- 1.14: 342 342 423 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5663 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Eldin Partridge
-- mangos: 300 
-- 1.13: 332 
-- 1.14: 333 343 380 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5664 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Alyssa Blaye
-- mangos: 300 
-- 1.13: 304 
-- 1.14: 315 336 345 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5665 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Lysta Bancroft
-- mangos: 300 
-- 1.14: 326 414 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5679 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Innkeeper Renee
-- mangos: 300 
-- 1.14: 323 
-- 2.5: 375 420 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5688 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Vance Undergloom
-- mangos: 300 
-- 2.5: 358 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5695 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Theresa
-- mangos: 300 
-- 2.5: 331 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5697 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Ageron Kargal
-- mangos: 300 
-- 1.14: 327 
-- 2.5: 331 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5724 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Gina Lang
-- mangos: 300 
-- 2.5: 422 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5750 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Nurse Neela
-- mangos: 300 
-- 1.14: 345 
-- 2.5: 306 418 435 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5759 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Tumi
-- mangos: 300 
-- 2.5: 382 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5812 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Shimra
-- mangos: 300 
-- 1.14: 312 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5817 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Dark Iron Geologist
-- mangos: 500 
-- 1.13: 321 330 338 345 363 374 379 385 390 405 463 473 
-- 1.14: 307 318 321 325 335 346 384 388 446 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5839 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Dark Iron Steamsmith
-- mangos: 500 
-- 1.13: 316 337 404 450 475
-- 1.14: 318 330 348 349 356 365 366 369 370 371 392 417 418 418 419 421 427 427 471 475 477 479 480
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5840 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Slave Worker
-- mangos: 500 
-- 1.13: 307 316 317 319 319 320 329 336 350 366 383 399 418 421 432 440 450 477 481
-- 1.14: 312 322 326 337 400 410 430 430 437 456 463 470
-- 2.5: 341 381
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5843 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Dark Iron Slaver
-- mangos: 300 500 
-- 1.13: 307 308 311 334 338 369 376 385 391 396 400 402 404 404 425 428 430 432 436 438 442 446 477
-- 1.14: 319 328 329 332 381 381 384 405 432 469 473 478
-- 2.5: 306 309 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5844 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Blazing Elemental
-- mangos: 500 
-- 1.13: 395 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5850 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Tempered War Golem
-- mangos: 500 
-- 1.13: 424 
-- 1.14: 401 451 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5853 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Heavy War Golem
-- mangos: 500 
-- 1.13: 370 372 405 454
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5854 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Magma Elemental
-- mangos: 500 
-- 1.13: 385 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5855 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Glassweb Spider
-- mangos: 500 
-- 1.13: 457 
-- 1.14: 305 378 455 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5856 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Greater Lava Spider
-- mangos: 500 
-- 1.13: 352 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5858 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Twilight Dark Shaman
-- mangos: 500 
-- 1.13: 907 926 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 5860 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Twilight Fire Guard
-- mangos: 500 
-- 1.13: 853 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 5861 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Twilight Geomancer
-- mangos: 500 
-- 1.14: 820 963 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 5862 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Larhka
-- mangos: 413 
-- 2.5: 427 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5871 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Gwyn Farrow
-- mangos: 413 
-- 2.5: 357 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5886 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Xanis Flameweaver
-- mangos: 375 
-- 2.5: 306 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5906 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Vira Younghoof
-- mangos: 375 
-- 2.5: 362 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5939 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Zansoa
-- mangos: 300 
-- 2.5: 395 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5942 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Birgitte Cranston
-- mangos: 250 
-- 2.5: 369 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5957 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Wretched Lost One
-- mangos: 300 
-- 1.13: 320 323 365 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5979 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Black Slayer
-- mangos: 300 360 380 
-- 1.13: 318 320 323 346 364 366 372 372 381 381 384 394 414 418 433 434 439 448 469 471
-- 1.14: 310 350 377 398 403 417 434 444 455 456 484
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5982 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Starving Snickerfang
-- mangos: 300 
-- 1.13: 331 332 334 337 340 342 350 352 353 357 364 376 378 379 383 386 409 410 412 419 431 434 437 440 446 451 473
-- 1.14: 378
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5984 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Snickerfang Hyena
-- mangos: 300 
-- 1.13: 333
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5985 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Scorpok Stinger
-- mangos: 300 
-- 1.13: 309 313 318 326 330 332 340 345 351 357 361 364 373 387 388 398 405 413 436 442 443 462 465 465 467 474
-- 1.14: 308 326
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5988 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Redstone Basilisk
-- mangos: 300 
-- 1.13: 332 332 335 341 349 349 391 438 476
-- 1.14: 306 332 355 371 376 433 436 442 481
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5990 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Redstone Crystalhide
-- mangos: 300 
-- 1.13: 363
-- 1.14: 322 324 334 373 401 404 416 420 421 425 438 451 454 482 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5991 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Ashmane Boar
-- mangos: 300 
-- 1.13: 338 360 360 369 397 429 444 463 465
-- 1.14: 305 308 311 327 332 377 384 395 398 432 436 452 452 459 467 474 478 483
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5992 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Nethergarde Soldier
-- mangos: 300 
-- 2.5: 453 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 5999 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Shadowsworn Cultist
-- mangos: 300 
-- 1.13: 360 423 480 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 6004 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Shadowsworn Enforcer
-- mangos: 300 
-- 1.14: 441 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 6007 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Felhound
-- mangos: 300 
-- 2.5: 381 445 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 6010 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Felguard Sentry
-- mangos: 300 
-- 2.5: 388 467 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 6011 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Lotherias
-- mangos: 300 
-- 2.5: 352 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 6034 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Auberdine Sentinel
-- mangos: 275 
-- 2.5: 437 455
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 6086 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Highborne Apparition
-- mangos: 333 
-- 1.14: 423 482 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 6116 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Haldarr Satyr
-- mangos: 333 
-- 1.13: 319 334 363 
-- 1.14: 363 383 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 6125 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Cliff Walker
-- mangos: 600 
-- 1.14: 1802 1802 1804 1804 
UPDATE `creature` SET `spawntimesecsmin`=1800, `spawntimesecsmax`=1800 WHERE 6148 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Stephanie Turner
-- mangos: 270 
-- 1.13: 446 451 
-- 1.14: 310 327 341 362 388 390 440 456 470 477 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 6174 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Timbermaw Den Watcher
-- mangos: 333 
-- 1.14: 325 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 6187 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Timbermaw Shaman
-- mangos: 333 
-- 1.14: 386 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 6188 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Spitelash Warrior
-- mangos: 333 
-- 1.14: 392 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 6190 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Spitelash Siren
-- mangos: 333 
-- 1.13: 304 311 319 323 323 326 335 355 382 393 400 409 414 425 436 437 439 453 457 469 477
-- 1.14: 311 318 337 343 354 358 359 371 380 382 395 405 450 457 465 466
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 6195 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Blood Elf Surveyor
-- mangos: 333 
-- 1.13: 326 345 361 463 
-- 1.14: 334 379 470 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 6198 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Caverndeep Invader
-- mangos: 1677 
-- 2.5: 770 788 833 840 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 6208 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Stockade Archer
-- mangos: 540 
-- 2.5: 187 194 195 202 203 225 
UPDATE `creature` SET `spawntimesecsmin`=180, `spawntimesecsmax`=240 WHERE 6237 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Bailor Stonehand
-- mangos: 300 
-- 2.5: 326 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 6241 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Innkeeper Janene
-- mangos: 360 
-- 2.5: 307 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 6272 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Balthus Stoneflayer
-- mangos: 310 
-- 2.5: 358 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 6291 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Kurdram Stonehammer
-- mangos: 275 
-- 2.5: 425 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 6297 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Thelgrum Stonehammer
-- mangos: 275 
-- 2.5: 387 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 6298 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Delfrum Flintbeard
-- mangos: 413 
-- 2.5: 307 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 6299 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Elisa Steelhand
-- mangos: 275 
-- 2.5: 400 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 6300 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Gorbold Steelhand
-- mangos: 275 
-- 2.5: 398 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 6301 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Thunderhead Hippogryph
-- mangos: 333 
-- 1.13: 464
-- 1.14: 325 381 459 485
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 6375 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Deathguard Podrig
-- mangos: 413 
-- 2.5: 302 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 6389 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Ula'elek
-- mangos: 300 
-- 2.5: 315 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 6408 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Orm Stonehoof
-- mangos: 250 
-- 2.5: 335 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 6410 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Gamon
-- mangos: 300 
-- 1.13: 300 301 303 304 304 307 312 313 313 313 314 314 315 315 315 316 316 316 317 317 319 320 321 322 322 324 325 326 329 330 330 332 333 336 337 340 340 341 344 345 345 345 346 346 349 350 354 355 356 356 359 359 360 360 361 362 363 363 364 367 368 370 371 372 372 373 375 375 376 378 379 383 384 384 384 386 389 390 391 392 392 394 394 395 395 396 400 401 402 402 402 403 406 410 412 412 412 412 413 413 414 414 415 417 421 421 422 422 425 426 427 428 430 431 431 434 439 440 440 441 442 447 448 449 450 450 452 456 457 457 459 460 462 462 463 475 477 478 483 484
-- 1.14: 319 334 337 366 403 411 465 471 
-- 2.5: 302 304 305 308 308 309 310 310 310 311 313 315 317 322 324 328 328 328 330 333 334 336 339 339 343 343 344 344 345 345 346 347 350 353 356 361 362 362 362 363 365 366 366 366 368 368 370 370 371 371 371 372 373 374 376 380 381 382 382 384 384 386 388 390 392 394 395 396 396 396 397 399 411 413 415 415 415 416 418 419 421 421 422 423 425 426 428 429 429 431 431 432 434 436 437 439 442 442 445 445 447 447 449 451 452 452 456 458 460 460 460 461 461 462 463 465 466 466 467 467 469 472 476 477 478 479
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 6466 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Ravasaur Hunter
-- mangos: 300 
-- 2.5: 400 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 6507 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Un'Goro Stomper
-- mangos: 300 
-- 1.13: 341 346 351 371 390 410 414 435 464
-- 1.14: 308 420 434 
-- 2.5: 356 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 6513 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Tar Lurker
-- mangos: 300 
-- 1.14: 334 359 371 407 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 6518 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Dark Iron Rifleman
-- mangos: 300 
-- 1.13: 737 
-- 2.5: 748 828 850 859 877 898 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 6523 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Gorishi Reaver
-- mangos: 300 
-- 1.14: 320 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 6553 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Ghok'kah
-- mangos: 360 
-- 2.5: 313 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 6567 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Overseer Glibby
-- mangos: 413 
-- 1.14: 319 405 440 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 6606 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Lord Cyrik Blackforge
-- mangos: 413 
-- 1.13: 359
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 6668 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Westfall Woodworker
-- mangos: 300 
-- 2.5: 322 391 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 6670 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Amie Pierce
-- mangos: 360 
-- 2.5: 416 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 6732 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Innkeeper Hearthstove
-- mangos: 300 
-- 2.5: 479 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 6734 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Innkeeper Bates
-- mangos: 275 
-- 2.5: 307 467 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 6739 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Ratslin Maime
-- mangos: 300 
-- 1.14: 373 
-- 2.5: 371 419 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 6785 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Den Mother
-- mangos: 413 
-- 1.14: 354 394 447 472 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 6788 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Thistle Cub
-- mangos: 413 
-- 1.14: 303 304 310 342 347 359 369 391 401 413 413 417 419 428 448 452 461 467 
-- 2.5: 321 402 411 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 6789 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Innkeeper Trelayne
-- mangos: 300 
-- 2.5: 453 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 6790 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Tannok Frosthammer
-- mangos: 270 
-- 2.5: 357 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 6806 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Defias Dockmaster
-- mangos: 270 
-- 1.13: 17 
-- 1.14: 18 18 
-- 2.5: 16 
UPDATE `creature` SET `spawntimesecsmin`=15, `spawntimesecsmax`=20 WHERE 6846 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Yalda
-- mangos: 275 
-- 2.5: 315 374 383 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 6887 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Innkeeper Karakul
-- mangos: 300 
-- 2.5: 315 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 6930 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Dran Droffers
-- mangos: 300 
-- 2.5: 406 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 6986 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Malton Droffers
-- mangos: 300 
-- 2.5: 414 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 6987 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Blackrock Soldier
-- mangos: 500 
-- 1.13: 321 
-- 2.5: 307 461 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 7025 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Blackrock Sorcerer
-- mangos: 500 
-- 1.13: 426 
-- 1.14: 414 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 7026 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Blackrock Slayer
-- mangos: 500 
-- 1.13: 322 
-- 1.14: 344 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 7027 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Blackrock Warlock
-- mangos: 500 
-- 1.13: 383 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 7028 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Firegut Ogre
-- mangos: 500 
-- 1.13: 311 321 326 352 368 370 463 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 7033 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Firegut Ogre Mage
-- mangos: 500 
-- 1.13: 363 409 424 
-- 1.14: 322 351 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 7034 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Thaurissan Spy
-- mangos: 500 
-- 2.5: 396 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 7036 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- War Reaver
-- mangos: 500 
-- 1.13: 335 
-- 1.14: 300 304 304 304 304 305 306 306 306 306 306 307 307 308 308 308 309 309 312 313 314 315 315 317 317 317 317 318 319 319 319 320 320 320 321 321 322 323 324 326 327 328 333 335 336 337 340 342 343 344 344 345 346 346 347 350 350 350 351 351 351 355 355 356 356 356 358 358 359 359 361 361 363 364 365 365 366 366 367 369 369 370 374 374 376 377 377 378 378 378 379 383 383 383 384 384 384 384 385 386 388 388 389 389 390 392 392 393 393 393 394 394 395 398 398 400 400 401 401 401 404 405 405 406 408 409 410 410 410 410 411 412 413 415 416 416 417 418 419 420 420 421 421 422 423 423 425 426 427 429 429 430 430 431 431 432 433 434 434 434 435 435 437 439 440 443 443 444 445 445 445 446 446 448 449 452 452 452 452 452 452 453 453 454 454 457 457 460 461 462 462 462 463 463 465 466 467 467 468 468 469 469 471 472 472 472 474 474 478 478 479 479 482 482 482
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 7039 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Black Wyrmkin
-- mangos: 500 
-- 1.13: 420 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 7041 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Flamescale Dragonspawn
-- mangos: 500 
-- 1.13: 367 
-- 1.14: 314 322 363 365 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 7042 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Searscale Drake
-- mangos: 300 500 900 
-- 1.13: 324 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 7046 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Black Broodling
-- mangos: 500 
-- 1.13: 453 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 7047 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Flamescale Broodling
-- mangos: 500 
-- 1.13: 314 402 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 7049 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Blackrock Worg
-- mangos: 500 
-- 1.13: 319 401 
-- 2.5: 365 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 7055 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Vile Ooze
-- mangos: 300 
-- 1.13: 751 859 893 915 942 
-- 1.14: 842 853 868 884 922 
-- 2.5: 734 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 7093 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Jadefire Satyr
-- mangos: 300 
-- 1.14: 317 374 400 437 444 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 7105 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Jadefire Trickster
-- mangos: 300 
-- 1.13: 354 362 404 
-- 1.14: 307 308 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 7107 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Jadefire Felsworn
-- mangos: 300 
-- 1.13: 382 
-- 1.14: 340 340 406 449 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 7109 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Jadefire Hellcaller
-- mangos: 300 
-- 1.13: 321 341 
-- 1.14: 328 389 462 
-- 2.5: 365 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 7111 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Jaedenar Cultist
-- mangos: 300 
-- 1.13: 745 823 917 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 7112 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Jaedenar Guardian
-- mangos: 300 
-- 1.13: 785 788 807 816 848 863 886 956
-- 1.14: 726 753 753 763 799 846 863 945 
-- 2.5: 794 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 7113 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Jaedenar Enforcer
-- mangos: 300 
-- 1.13: 790 868 877 894 934 958
-- 1.14: 763 780 820 846 877 
-- 2.5: 932 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 7114 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Jaedenar Darkweaver
-- mangos: 300 
-- 1.13: 785 877 907
-- 1.14: 735 792 916 929 932 964 
-- 2.5: 803 870 941 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 7118 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Jaedenar Hound
-- mangos: 300 
-- 1.13: 747 807 832 874 888 901 928
-- 1.14: 757
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 7125 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Jaedenar Hunter
-- mangos: 300 
-- 1.13: 756 768 823 
-- 1.14: 805 826 850 859 921 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 7126 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Toxic Horror
-- mangos: 300 
-- 1.13: 308 319 326 326 332 336 337 340 343 345 351 355 359 362 365 365 369 372 377 379 380 385 389 390 394 397 399 412 416 432 436 436 439 446 449 450 451 453 457 465 466 469 476 480
-- 1.14: 213 215 246 315 318 323 324 329 330 330 334 334 336 336 346 347 348 348 351 352 355 357 361 365 367 370 370 376 379 383 386 393 397 399 400 404 409 410 410 411 411 431 431 432 439 441 443 444 447 447 454 456 458 458 464 464 465 467 468 469 470 473 474 475 476 481
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 7132 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Irontree Stomper
-- mangos: 300 
-- 1.14: 371 420 421
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 7139 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Deadwood Warrior
-- mangos: 300 
-- 1.13: 303 316 318 328 334 367 368 430 433 436 472 477 
-- 1.14: 302 306 308 308 308 309 310 320 333 348 351 354 356 359 361 361 368 374 375 380 383 383 388 392 396 396 397 403 408 413 415 427 445 450 453 453 455 458 460 464 475 482 482
-- 2.5: 456 481 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 7153 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Deadwood Gardener
-- mangos: 300 
-- 1.13: 320 334 367 374 378 379 402 403 426 457 
-- 1.14: 310 311 315 320 323 325 340 343 348 351 356 364 364 366 377 381 382 388 390 394 405 408 428 428 434 434 466 468 480
-- 2.5: 327 350 378 393 453 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 7154 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Deadwood Pathfinder
-- mangos: 300 
-- 1.13: 313 331 336 369 408 431 
-- 1.14: 307 316 321 324 329 341 358 374 377 383 386 391 399 399 410 411 419 439 441 456 464
-- 2.5: 313 399 406 428 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 7155 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Deadwood Den Watcher
-- mangos: 300 
-- 1.13: 380 382 392 402 417 429 470 480
-- 1.14: 423 447 
-- 2.5: 330 370 463 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 7156 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Ferocitas the Dream Eater
-- mangos: 300 
-- 1.13: 63 63 63 63 63 63 
-- 1.14: 63 63 
UPDATE `creature` SET `spawntimesecsmin`=63, `spawntimesecsmax`=63 WHERE 7234 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Foreman Silixiz
-- mangos: 413 
-- 1.14: 463 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 7287 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Mutated Venture Co. Drone
-- mangos: 413 
-- 1.13: 480 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 7310 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Priestess A'moora
-- mangos: 300 
-- 2.5: 435 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 7313 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Rageclaw
-- mangos: 300 
-- 1.13: 62 63 64 64
UPDATE `creature` SET `spawntimesecsmin`=60, `spawntimesecsmax`=65 WHERE 7318 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Restless Shade
-- mangos: 600 
-- 1.13: 468
-- 2.5: 320 325 331 351 376 396 408 416 440 462 470 478 478
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 7370 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Chief Engineer Bilgewhizzle
-- mangos: 300 
-- 1.13: 405 
-- 1.14: 316 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 7407 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Spigot Operator Luglunket
-- mangos: 300 
-- 1.13: 389 
-- 1.14: 404 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 7408 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Frostsaber Cub
-- mangos: 333 
-- 1.13: 325 
-- 1.14: 308 310 311 311 313 318 319 321 323 324 328 332 335 335 336 338 341 341 341 342 353 354 358 360 365 368 369 369 370 372 375 378 379 381 383 388 393 396 399 400 401 402 404 405 410 411 415 419 420 422 423 423 425 425 425 429 431 431 433 433 440 443 446 452 455 457 458 459 460 463 465 474 477 477 477 480 484 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 7430 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Frostsaber
-- mangos: 333 
-- 1.13: 311 313 317 364 406 463 469 472
-- 1.14: 309 310 321 324 326 328 342 344 345 348 348 353 359 368 372 373 373 388 393 396 401 403 403 405 413 413 433 441 443 444 451 451 451 457 461 466 467 468 476 477 479 482 486
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 7431 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Frostsaber Stalker
-- mangos: 333 
-- 1.13: 340 424 438 
-- 1.14: 303 306 306 308 312 322 330 332 335 337 338 340 348 349 349 351 353 357 357 364 368 375 376 382 382 385 386 401 408 408 421 432 434 438 441 442 446 447 450 452 452 453 455 457 457 459 471 473
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 7432 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Frostsaber Huntress
-- mangos: 333 
-- 1.14: 315 319 323 329 330 335 359 367 383 383 385 388 389 392 395 400 402 403 407 413 413 414 433 444 446 455 459 459 460 467 478 480 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 7433 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Frostsaber Pride Watcher
-- mangos: 333 
-- 1.14: 324 389 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 7434 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Winterfall Ursa
-- mangos: 240 360 
-- 1.13: 320 321 327 353 364 371 392 404 415 451 453 453 459 
-- 1.14: 337 342 351 351 438 444
-- 2.5: 349 351 455
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 7438 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Winterfall Shaman
-- mangos: 240 360 
-- 1.13: 302 307 319 321 340 346 355 367 376 387 387 396 397 402 411 430 433 441 465 476 479
-- 1.14: 308 330 332 333 343 348 354 359 368 382 398 400 418 420 436 449 467 468
-- 2.5: 309 377 379 457 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 7439 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Winterfall Den Watcher
-- mangos: 240 360 
-- 1.13: 306 307 317 325 331 333 347 360 363 378 386 395 395 395 396 409 417 422 424 435 438 439 440 445 446 447 466 477 479 483
-- 1.14: 304 305 329 331 335 349 355 357 358 360 362 363 378 380 383 387 396 399 404 406 416 431 434 435 437 439 443 446 446 447 448 455 458 459 472
-- 2.5: 302 320 332 335 339 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 7440 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Winterfall Pathfinder
-- mangos: 333 
-- 1.13: 307 308 320 332 336 337 340 340 341 348 354 360 366 374 384 390 394 394 397 408 410 412 417 424 441 444 449 452 456 460 465 466 469 479
-- 1.14: 355 370 390 407 457
-- 2.5: 311 365 419 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 7442 IN (id, id2, id3, id4, id5) && `patch_max`=10;



-- Raging Owlbeast
-- mangos: 333 
-- 2.5: 403 462 467 480 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 7451 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Crazed Owlbeast
-- mangos: 333 
-- 1.13: 328 450 
-- 1.14: 366 399 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 7452 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Winterspring Owl
-- mangos: 333 
-- 2.5: 389 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 7455 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Ice Thistle Yeti
-- mangos: 333 
-- 1.13: 345 347 358 388 395 434 
-- 1.14: 379 455 
-- 2.5: 345 427 432 468
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 7458 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Ice Thistle Matriarch
-- mangos: 333 
-- 1.13: 333 429 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 7459 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Bengor
-- mangos: 300 
-- 2.5: 432 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 7643 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Servant of Allistarj
-- mangos: 300 
-- 1.14: 458 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 7670 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Alessandro Luca
-- mangos: 300 
-- 2.5: 441 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 7683 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Grimtotem Raider
-- mangos: 300 
-- 1.13: 470
-- 1.14: 304 305 314 315 329 342 349 350 359 364 372 373 374 393 395 398 406 413 417 429 431 440 449 465 467 471 473 474
-- 2.5: 333 471 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 7725 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Southsea Pirate
-- mangos: 120 300 
-- 1.13: 353 362 389 432 470
-- 1.14: 304 307 313 324 335 338 338 348 362 366 371 375 383 383 384 389 390 395 398 404 407 416 417 420 423 432 435 438 445 447 449 450 453 453 459 460 471 473 478 481 481 481
-- 2.5: 314 314 318 318 320 322 328 335 339 339 341 341 343 348 354 359 367 377 379 380 380 387 387 393 396 400 404 405 419 422 464 472 485
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 7855 IN (id, id2, id3, id4, id5) && `patch_max`=10 && `spawntimesecsmin`=300 && `spawntimesecsmax`=300;


-- Southsea Freebooter
-- mangos: 300 
-- 1.13: 319 380 398 407 438 441 468
-- 1.14: 309 320 324 326 332 335 341 364 372 373 380 384 392 393 394 398 408 424 431 432 435 440 444 449 453 454 460 463 465 472 479
-- 2.5: 302 307 309 317 325 327 339 339 348 349 371 372 372 373 374 376 377 388 391 408 408 411 415 441 444 445 448 465 465 466 469 480
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 7856 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Southsea Dock Worker
-- mangos: 300 
-- 1.13: 313 331 366 370 382 399 417 421 445 446 459 485
-- 1.14: 302 303 306 306 306 309 311 311 312 318 320 320 324 324 325 325 328 332 332 332 334 334 336 338 338 339 340 340 342 343 346 346 350 351 351 353 354 357 360 360 362 362 365 365 369 370 372 373 375 376 376 377 380 381 390 391 391 392 395 399 400 403 404 405 405 407 412 413 413 414 415 419 421 422 423 426 427 428 433 434 437 440 443 444 444 444 449 451 452 453 455 456 456 456 457 459 460 462 463 464 465 466 470 471 472 476 477 478 478 479
-- 2.5: 303 308 309 309 310 312 315 316 316 317 318 322 324 329 331 331 334 342 343 346 346 347 353 354 356 357 357 359 360 363 364 366 368 368 370 370 373 373 373 374 375 375 381 382 386 387 390 394 395 398 401 402 404 406 406 406 406 407 408 411 413 414 416 418 419 420 420 421 422 423 425 427 428 431 431 434 435 436 440 441 443 444 449 449 452 453 455 461 461 464 465 466 467 468 471 476 477 477 481 481 482 483 485
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 7857 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Southsea Swashbuckler
-- mangos: 120 300 
-- 1.13: 302 308 309 313 320 324 330 335 389 402 428 434 434 439 442 446 451 452 459 461 466 476 476 480
-- 1.14: 310 310 311 314 316 317 319 325 326 331 331 333 336 341 343 345 347 348 348 350 355 355 357 362 362 368 383 383 385 385 385 397 408 408 410 410 415 428 431 434 439 442 442 443 445 449 457 459 463 471 473 473 474 478 479 480
-- 2.5: 304 308 309 314 315 317 317 318 321 323 324 325 327 328 333 336 338 343 344 348 349 351 356 365 368 369 373 378 381 383 392 394 396 396 397 398 406 410 415 423 425 428 433 439 446 456 459 476 479 482 483
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 7858 IN (id, id2, id3, id4, id5) && `patch_max`=10 && `spawntimesecsmin`=300 && `spawntimesecsmax`=300;


-- Wildhammer Sentry
-- mangos: 350 
-- 2.5: 385 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 7865 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Andre Firebeard
-- mangos: 300 
-- 1.13: 367 437 
-- 1.14: 340 366 374 380 380 404 415 426 481 
-- 2.5: 306 330 335 393 394 410 429 443 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 7883 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Zjolnir
-- mangos: 300 
-- 2.5: 348 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 7952 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Xar'Ti
-- mangos: 300 
-- 2.5: 320 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 7953 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Milli Featherwhistle
-- mangos: 430 
-- 2.5: 321 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 7955 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Deathguard Elite
-- mangos: 300 
-- 1.14: 300 309 382 388 407 407 414 455 464 483
-- 2.5: 425 435
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 7980 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Brother Karman
-- mangos: 360 
-- 2.5: 413 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 8140 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Camp Mojache Brave
-- mangos: 300 
-- 1.13: 343 348 386 393 412 420 447 452 457
-- 1.14: 316 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 8147 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Kargath Grunt
-- mangos: 300 
-- 2.5: 344 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 8155 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Nina Lightbrew
-- mangos: 300 
-- 2.5: 353 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 8178 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Slime Maggot
-- mangos: 7200 
-- 1.14: 3604 3604 3605 
UPDATE `creature` SET `spawntimesecsmin`=3600, `spawntimesecsmax`=3600 WHERE 8311 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Atal'ai Slave
-- mangos: 7200 
-- 1.14: 1800 1803 1806 
-- 2.5: 1800 1801 1802 1804 1806 1820 
UPDATE `creature` SET `spawntimesecsmin`=1800, `spawntimesecsmax`=1800 WHERE 8318 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Hewa
-- mangos: 250 
-- 2.5: 309 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 8358 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Ahanu
-- mangos: 250 
-- 2.5: 332 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 8359 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Kuruk
-- mangos: 250 
-- 2.5: 414 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 8362 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Pakwa
-- mangos: 250 
-- 2.5: 331 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 8364 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Deep Lurker
-- mangos: 7200 
-- 1.14: 3602 3604 3604 3607 
UPDATE `creature` SET `spawntimesecsmin`=3600, `spawntimesecsmax`=3600 WHERE 8384 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Chemist Cuely
-- mangos: 300 
-- 2.5: 181 
UPDATE `creature` SET `spawntimesecsmin`=180, `spawntimesecsmax`=180 WHERE 8390 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Thersa Windsong
-- mangos: 60 
-- 1.13: 32 35 
-- 2.5: 34 36 
UPDATE `creature` SET `spawntimesecsmin`=30, `spawntimesecsmax`=35 WHERE 8393 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Sentinel Keldara Sunblade
-- mangos: 333 
-- 1.13: 352 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 8397 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Obsidion
-- mangos: 500 
-- 1.13: 3 5 
-- 1.14: 4 
-- 2.5: 5 5 
UPDATE `creature` SET `spawntimesecsmin`=5, `spawntimesecsmax`=5 WHERE 8400 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Jeremiah Payson
-- mangos: 300 
-- 1.13: 389 
-- 1.14: 310 323 338 356 361 365 372 388 393 399 401 413 420 422 446 446 446 449 450 460 476 482 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 8403 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Dying Archaeologist
-- mangos: 500 
-- 2.5: 343 373 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 8417 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Twilight Idolater
-- mangos: 500 
-- 1.13: 409 
-- 1.14: 389 431 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 8419 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Dark Iron Sentry
-- mangos: 500 
-- 1.13: 747 857
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 8504 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Rynthariel the Keymaster
-- mangos: 600 
-- 1.14: 240 
-- 2.5: 189 226 
UPDATE `creature` SET `spawntimesecsmin`=180, `spawntimesecsmax`=240 WHERE 8518 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Blighted Surge
-- mangos: 345 
-- 1.14: 390 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 8519 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Plague Ravager
-- mangos: 345 
-- 1.14: 442 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 8520 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Scourge Soldier
-- mangos: 345 
-- 1.13: 442 
-- 1.14: 331 336 355 357 374 381 423 432 434 462
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 8523 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Cursed Mage
-- mangos: 345 
-- 1.13: 434
-- 1.14: 322 333 358 358 388 415 433 483 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 8524 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Scourge Warder
-- mangos: 345 
-- 1.13: 325 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 8525 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Dread Weaver
-- mangos: 345 
-- 1.13: 352 361 392 414 440 447
-- 1.14: 309 365 417 430 439 439 443 443 444 444 448 479 480
-- 2.5: 392 423 461 468 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 8528 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Scourge Champion
-- mangos: 345 
-- 1.13: 323 395 432 467 
-- 1.14: 304 309 311 315 330 340 366 370 372 411 418 427 444 460 466 472 479
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 8529 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Cannibal Ghoul
-- mangos: 345 
-- 1.13: 365 459 
-- 1.14: 340 354 373 377 442 454
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 8530 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Diseased Flayer
-- mangos: 345 
-- 1.13: 337 355 396
-- 1.14: 340 343 350 364 398 407 410 414 423 448 450 450
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 8532 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Eyeless Watcher
-- mangos: 345 
-- 1.13: 375
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 8539 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Torn Screamer
-- mangos: 345 
-- 1.13: 304 399 
-- 1.14: 357 371 385 405 459 460 470 475 478 482 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 8540 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Hate Shrieker
-- mangos: 345 
-- 1.13: 352 449 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 8541 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Death Singer
-- mangos: 345 
-- 1.13: 353 434 438 468 473
-- 1.14: 309 311 321 326 333 344 356 376 404 410 421 430 431 445 448 450 477 482
-- 2.5: 416 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 8542 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Stitched Horror
-- mangos: 345 
-- 1.13: 416 421 449 
-- 1.14: 355 399 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 8543 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Dark Adept
-- mangos: 345 
-- 1.13: 305 310 313 329 338 351 353 379 382 391 407 411 418 431 434 434 446 449 452 456 459 463 464 470 477 478 
-- 2.5: 449 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 8546 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Chief Sharptusk Thornmantle
-- mangos: 375 
-- 1.13: 60 
-- 1.14: 61 65 
UPDATE `creature` SET `spawntimesecsmin`=60, `spawntimesecsmax`=65 WHERE 8554 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Crypt Fiend
-- mangos: 345 
-- 1.13: 331 346 423 461 
-- 1.14: 307 346
-- 2.5: 480 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 8555 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Crypt Walker
-- mangos: 345 
-- 1.13: 305 310 318 365 382 457 
-- 1.14: 307 314 377 387 422 431 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 8556 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Crypt Horror
-- mangos: 345 
-- 1.14: 375 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 8557 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Crypt Slayer
-- mangos: 345 
-- 1.13: 327 331 332 333 342 343 347 365 367 376 380 390 393 394 400 408 411 424 427 430 436 437 439 444 453 456 462 466 474 479 479 479 481 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 8558 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Mossflayer Shadowhunter
-- mangos: 345 
-- 1.13: 304 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 8561 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Woodsman
-- mangos: 345 
-- 1.13: 356 381 394 406 422 477 
-- 1.14: 307 326 381 390 421 440 474 
-- 2.5: 336 375 376 387 423 435 463 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 8563 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Ranger
-- mangos: 345 
-- 1.13: 362 406 444 477 
-- 1.14: 339 353 361 369 409 413 
-- 2.5: 303 304 307 340 385 407 407 415 429 430 450 460 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 8564 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Pathstrider
-- mangos: 345 
-- 1.13: 309 324 377 
-- 1.14: 303 321 345 391 444 
-- 2.5: 302 328 339 350 357 361 371 380 387 409 415 418 419 425 437 442 458 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 8565 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Dark Iron Lookout
-- mangos: 500 
-- 1.14: 468 468 470
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 8566 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Living Decay
-- mangos: 345 
-- 1.14: 332 333 337 346 352 361 379 398 409 414 416 427 469 474 479
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 8606 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Rotting Sludge
-- mangos: 345 
-- 1.14: 317 358 364 388 406 407 418 426 433 439 461 461 471 475 479 480
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 8607 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Saern Priderunner
-- mangos: 250 
-- 2.5: 355 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 8664 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Felbeast
-- mangos: 300 
-- 1.14: 356 369 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 8675 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Mosshoof Runner
-- mangos: 333 
-- 1.13: 324 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 8759 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Forest Ooze
-- mangos: 333 
-- 1.14: 476 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 8766 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Anvilrage Overseer
-- mangos: 370 7200 
-- 1.14: 837 856 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 8889 IN (id, id2, id3, id4, id5) && `patch_max`=10 && `map`=0;


-- Quarry Slave
-- mangos: 500 
-- 1.14: 302 306 309 323 331 370 412 429 431 431 433 446 465 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 8917 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Innkeeper Heather
-- mangos: 300 
-- 2.5: 428 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 8931 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Christopher Hewen
-- mangos: 300 
-- 2.5: 420 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 8934 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Angerclaw Bear
-- mangos: 300 
-- 2.5: 361 389 429 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 8956 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Felpaw Wolf
-- mangos: 300 
-- 2.5: 329 383 427 474 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 8959 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Felpaw Scavenger
-- mangos: 300 
-- 1.14: 471 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 8960 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Gershala Nightwhisper
-- mangos: 413 
-- 2.5: 386 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 8997 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Scarshield Grunt
-- mangos: 500 
-- 1.14: 791 870 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 9043 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Scarshield Sentry
-- mangos: 500 
-- 1.14: 734 773 779 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 9044 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Scarshield Acolyte
-- mangos: 10800 
-- 1.13: 7208 
UPDATE `creature` SET `spawntimesecsmin`=7200, `spawntimesecsmax`=7200 WHERE 9045 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Scarshield Quartermaster
-- mangos: 150 172800 259200 
-- 1.14: 62 64 
-- 2.5: 61 61 
UPDATE `creature` SET `spawntimesecsmin`=60, `spawntimesecsmax`=65 WHERE 9046 IN (id, id2, id3, id4, id5) && `patch_max`=10 && `spawntimesecsmin`=150 && `spawntimesecsmax`=150;


-- Shadowmage Vivian Lagrave
-- mangos: 300 
-- 2.5: 444 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 9078 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Hierophant Theodora Mulvadania
-- mangos: 300 
-- 2.5: 405 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 9079 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Thunderheart
-- mangos: 300 
-- 2.5: 357 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 9084 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Scarshield Legionnaire
-- mangos: 10800 
-- 1.13: 7200 7237 
UPDATE `creature` SET `spawntimesecsmin`=7200, `spawntimesecsmax`=7200 WHERE 9097 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Scarshield Spellbinder
-- mangos: 10800 
-- 1.13: 7201 7212 7245 
UPDATE `creature` SET `spawntimesecsmin`=7200, `spawntimesecsmax`=7200 WHERE 9098 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Elder Diemetradon
-- mangos: 300 
-- 2.5: 378 476 486 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 9164 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Frenzied Pterrordax
-- mangos: 300 
-- 2.5: 387 482 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 9167 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Scarshield Warlock
-- mangos: 10800 
-- 1.13: 7207 7234 
UPDATE `creature` SET `spawntimesecsmin`=7200, `spawntimesecsmax`=7200 WHERE 9257 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Scarshield Raider
-- mangos: 10800 
-- 1.13: 7209 
UPDATE `creature` SET `spawntimesecsmin`=7200, `spawntimesecsmax`=7200 WHERE 9258 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Rilli Greasygob
-- mangos: 300 
-- 2.5: 322 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=4800 WHERE 9317 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Incendosaur
-- mangos: 300 1000 
-- 1.13: 182 182 183 183 
-- 1.14: 181 182 182 183 183 184 185 185 
UPDATE `creature` SET `spawntimesecsmin`=180, `spawntimesecsmax`=180 WHERE 9318 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Boss Copperplug
-- mangos: 413 
-- 1.14: 777 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 9336 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Scarshield Worg
-- mangos: 10800 
-- 1.13: 7200 7204 
UPDATE `creature` SET `spawntimesecsmin`=7200, `spawntimesecsmax`=7200 WHERE 9416 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Scarlet Warder
-- mangos: 721 725 726 733 741 744 745 749 776 786 789 800 803 810 811 818 827 837 839 840 845 853 860 866 870 874 881 884 886 887 898 903 907 935 947 948 952 953 962 963 971 972 976 979 983 1010 1015 1016 
-- 2.5: 954 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 9447 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Scarlet Praetorian
-- mangos: 728 731 732 743 756 778 786 791 796 812 823 828 847 858 864 870 875 888 902 910 919 930 943 947 961 972 998 1002 1009 
-- 1.14: 748 808 876 
-- 2.5: 874 899 920 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 9448 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Scarlet Curate
-- mangos: 744 752 786 797 804 817 818 906 938 940 955 965 1001 
-- 2.5: 916 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 9450 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Scarlet Archmage
-- mangos: 746 760 777 788 865 889 925 977 1009 1013 
-- 2.5: 803 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 9451 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Scarlet Enchanter
-- mangos: 728 730 744 773 774 775 789 800 805 807 810 812 814 824 828 831 832 834 848 850 851 855 857 858 870 876 884 892 911 927 940 941 951 953 961 964 989 1002 1011 1012 1013 1014 
-- 2.5: 744 756 821 845 924 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 9452 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Gadgetzan Bruiser
-- mangos: 300 
-- 1.13: 307 308 309 317 326 342 355 359 363 366 370 373 383 391 391 425 425 444 459 465 471 476 
-- 1.14: 314 316 356 368 378 409 428 461 461
-- 2.5: 476 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 9460 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Chieftain Bloodmaw
-- mangos: 300 
-- 2.5: 312 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 9462 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Overlord Ror
-- mangos: 300 
-- 1.14: 320 375 401 436 469 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 9464 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Shadow Lord Fel'dan
-- mangos: 300 
-- 1.14: 792 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 9517 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Freewind Brave
-- mangos: 300 
-- 1.14: 399 
-- 2.5: 335 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 9525 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Zanara
-- mangos: 360 
-- 1.14: 322 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 9552 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Nadia Vernon
-- mangos: 413 
-- 2.5: 309 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 9553 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Dreka'Sur
-- mangos: 300 
-- 2.5: 212 
UPDATE `creature` SET `spawntimesecsmin`=180, `spawntimesecsmax`=240 WHERE 9620 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Agnar Beastamer
-- mangos: 350 
-- 2.5: 185 
UPDATE `creature` SET `spawntimesecsmin`=180, `spawntimesecsmax`=240 WHERE 9660 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Giant Ember Worg
-- mangos: 500 
-- 1.13: 390 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 9697 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Firetail Scorpid
-- mangos: 500 
-- 1.13: 349 376 390 464 480 481 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 9698 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Salia
-- mangos: 300 
-- 1.13: 808 
-- 1.14: 819 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 9860 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Moora
-- mangos: 300 
-- 1.14: 864 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 9861 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Jaedenar Legionnaire
-- mangos: 300 
-- 1.13: 844 887 894 958
-- 1.14: 789 832 951 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 9862 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Entropic Beast
-- mangos: 300 
-- 1.14: 400 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 9878 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Entropic Horror
-- mangos: 300 
-- 1.14: 435 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 9879 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Shadowforge Flame Keeper
-- mangos: 600 
-- 1.13: 91 
UPDATE `creature` SET `spawntimesecsmin`=90, `spawntimesecsmax`=90 WHERE 9956 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Tharlidun
-- mangos: 400 
-- 2.5: 452 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 9976 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Wesley
-- mangos: 300 
-- 2.5: 367 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 9978 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Sarah Goode
-- mangos: 275 
-- 2.5: 323 464 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 9979 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Shelby Stoneflint
-- mangos: 310 
-- 2.5: 458 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 9980 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Sikwa
-- mangos: 275 
-- 2.5: 473 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 9981 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Kelsuwa
-- mangos: 275 
-- 2.5: 318 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 9983 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Shoja'my
-- mangos: 300 
-- 2.5: 340 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 9987 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Lina Hearthstove
-- mangos: 300 
-- 2.5: 334 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 9989 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Brackenwall Enforcer
-- mangos: 360 
-- 1.14: 333 473 
-- 2.5: 305 307 387 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 10036 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Bethaine Flinthammer
-- mangos: 300 
-- 2.5: 399 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 10046 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Michael
-- mangos: 360 
-- 2.5: 385 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 10047 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Hekkru
-- mangos: 300 
-- 2.5: 323 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 10049 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Seikwa
-- mangos: 250 
-- 2.5: 365 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 10050 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Morganus
-- mangos: 300 
-- 2.5: 370 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 10055 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Alassin
-- mangos: 300 
-- 2.5: 467 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 10056 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Theodore Mont Claire
-- mangos: 300 
-- 2.5: 337 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 10057 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Moonkin
-- mangos: 413 
-- 1.14: 354 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 10158 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Thrag Stonehoof
-- mangos: 375 
-- 2.5: 390 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 10278 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Umi Rumplesnicker
-- mangos: 333 
-- 2.5: 364 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 10305 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Emberstrife
-- mangos: 1200 
-- 1.13: 427 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 10321 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Trayexir
-- mangos: 300 
-- 2.5: 430 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 10369 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Prospector Ironboot
-- mangos: 300 
-- 2.5: 441 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 10460 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Lazy Peon
-- mangos: 300 
-- 2.5: 80 
UPDATE `creature` SET `spawntimesecsmin`=80, `spawntimesecsmax`=80 WHERE 10556 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Xavaric
-- mangos: 300 
-- 1.13: 868 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 10648 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Swine
-- mangos: 300 413 
-- 1.14: 442 459 485 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 10685 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Refuge Pointe Defender
-- mangos: 400 
-- 1.13: 331 344 344 356 356 
-- 2.5: 304 332 375 399 423 434 476 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 10696 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Novice Warrior
-- mangos: 375 
-- 1.13: 376 402 412 432 456 475 475 480 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 10721 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- High Chief Winterfall
-- mangos: 333 
-- 1.14: 459 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 10738 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Grimtotem Bandit
-- mangos: 300 
-- 1.13: 426 481 
-- 1.14: 369 445 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 10758 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Royal Overseer Bauhaus
-- mangos: 300 
-- 1.13: 326 389 
-- 1.14: 306 319 345 348 388 389 413 421 432 451 465 467 469 475 
-- 2.5: 470 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 10781 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Wandering Skeleton
-- mangos: 120 
-- 2.5: 424 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 10816 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Commander Ashlam Valorfist
-- mangos: 315 
-- 2.5: 344 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 10838 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Harbinger Balthazad
-- mangos: 300 
-- 1.14: 303 310 312 314 315 321 324 329 330 333 339 352 352 355 357 366 390 396 399 403 404 404 411 422 431 437 441 445 449 450 453 466 467 480
-- 2.5: 394 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 10879 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Winterfall Runner
-- mangos: 300 333 
-- 1.13: 64 69 76 
UPDATE `creature` SET `spawntimesecsmin`=60, `spawntimesecsmax`=90 WHERE 10916 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Dargh Trueaim
-- mangos: 300 
-- 2.5: 384 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 10930 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Frostwolf
-- mangos: 430 
-- 1.14: 346 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 10981 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Captured Arko'narin
-- mangos: 300 
-- 1.14: 72 
UPDATE `creature` SET `spawntimesecsmin`=60, `spawntimesecsmax`=90 WHERE 11016 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Mukdrak
-- mangos: 300 
-- 2.5: 454 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 11025 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Jenna Lemkenilli
-- mangos: 413 
-- 2.5: 470 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 11037 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Milla Fairancora
-- mangos: 300 
-- 2.5: 418 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 11041 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Sylvanna Forestmoon
-- mangos: 300 
-- 2.5: 448 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 11042 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Doctor Martin Felben
-- mangos: 300 
-- 2.5: 396 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 11044 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Trianna
-- mangos: 300 
-- 2.5: 364 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 11050 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Alchemist Arbington
-- mangos: 315 
-- 2.5: 359 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 11056 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Malcomb Wynn
-- mangos: 300 
-- 2.5: 437 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 11067 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Lalina Summermoon
-- mangos: 300 
-- 2.5: 343 442 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 11070 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Mot Dawnstrider
-- mangos: 375 
-- 2.5: 413 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 11071 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Faldron
-- mangos: 300 
-- 2.5: 402 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 11081 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Darianna
-- mangos: 300 
-- 2.5: 362 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 11083 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Awenasa
-- mangos: 300 
-- 1.14: 400 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 11117 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Azzleby
-- mangos: 333 
-- 2.5: 445 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 11119 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Bloodvenom Post Brave
-- mangos: 300 
-- 2.5: 360 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 11180 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Evie Whirlbrew
-- mangos: 333 
-- 2.5: 376 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 11188 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Everlook Bruiser
-- mangos: 333 
-- 2.5: 434 436 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 11190 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Kerlonian Evershade
-- mangos: 413 
-- 2.5: 61 
UPDATE `creature` SET `spawntimesecsmin`=60, `spawntimesecsmax`=60 WHERE 11218 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Mossflayer Zombie
-- mangos: 345 
-- 1.14: 395 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 11290 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Unliving Mossflayer
-- mangos: 345 
-- 1.13: 442 
-- 1.14: 362 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 11291 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Var'jun
-- mangos: 250 
-- 2.5: 183 183 
UPDATE `creature` SET `spawntimesecsmin`=180, `spawntimesecsmax`=180 WHERE 11407 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Necrofiend
-- mangos: 7200 
-- 1.13: 1800 1802 
-- 2.5: 1804 
UPDATE `creature` SET `spawntimesecsmin`=1800, `spawntimesecsmax`=1800 WHERE 11551 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Meilosh
-- mangos: 300 
-- 2.5: 349 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 11557 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Outcast Necromancer
-- mangos: 300 
-- 1.14: 469 
-- 2.5: 414 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 11559 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Undead Ravager
-- mangos: 300 
-- 1.14: 323 330 339 370 371 391 405 428 430 446 453 477 480
-- 2.5: 305 320 345 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 11561 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Drysnap Crawler
-- mangos: 300 
-- 1.13: 388 470 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 11562 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Drysnap Pincer
-- mangos: 300 
-- 1.14: 381 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 11563 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Alexia Ironknife
-- mangos: 315 
-- 2.5: 183 184 
UPDATE `creature` SET `spawntimesecsmin`=180, `spawntimesecsmax`=180 WHERE 11609 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Horde Peon
-- mangos: 300 
-- 2.5: 337 466 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 11656 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Flame Imp
-- mangos: 420 
-- 1.13: 331 332 333 336 362 363 365 365 366 366 369 369 375 381 399 399 399 400 400 400 400 400 408 412 412 413 414 415 419 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 11669 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Snowblind Windcaller
-- mangos: 120 
-- 1.13: 315 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 11675 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Horde Deforester
-- mangos: 300 
-- 1.14: 311 
-- 2.5: 422 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 11681 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Horde Grunt
-- mangos: 300 
-- 2.5: 325 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 11682 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Maraudine Priest
-- mangos: 300 
-- 1.13: 320 436 
-- 1.14: 363 
-- 2.5: 478 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 11685 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Ghostly Raider
-- mangos: 300 
-- 1.13: 394 400 
-- 1.14: 333 350 355 434 459 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 11686 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Ghostly Marauder
-- mangos: 300 
-- 1.13: 348 448 
-- 1.14: 306 333 340 395 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 11687 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Mannoroc Lasher
-- mangos: 300 
-- 2.5: 435 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 11697 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Hive'Ashi Stinger
-- mangos: 300 
-- 1.14: 886 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 11698 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Talendria
-- mangos: 300 
-- 2.5: 384 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 11715 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Stonelash Scorpid
-- mangos: 300 
-- 1.14: 382 403 431 444
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 11735 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Dredge Striker
-- mangos: 300 
-- 1.14: 397
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 11740 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Dust Stormer
-- mangos: 300 
-- 1.14: 317 318 345 350 352 356 356 360 368 402 405 422 433 437 452 457
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 11744 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Desert Rumbler
-- mangos: 300 
-- 1.14: 303 362 401 421 425 433 465 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 11746 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Ganoosh
-- mangos: 413 
-- 2.5: 334 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 11750 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Rock Worm
-- mangos: 300 
-- 1.13: 828 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 11788 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Locke Okarr
-- mangos: 300 
-- 1.14: 321 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 11820 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Moonglade Warden
-- mangos: 300 
-- 1.13: 357 
-- 1.14: 311 311 313 313 330 337 339 350 360 366 381 396 401 401 417 438 438 440 459 459 469 474 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 11822 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Twilight Avenger
-- mangos: 300 1620 3000 
-- 1.13: 323 333 365 385 476 
-- 1.14: 304 307 310 311 318 321 326 332 342 352 360 362 366 370 371 373 373 375 377 384 385 386 389 392 393 397 400 401 404 411 419 420 422 432 438 439 442 448 449 449 450 453 453 457 459 462 467 478
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 11880 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Twilight Stonecaller
-- mangos: 300 
-- 1.13: 322 339 350 373 393 424 454 465 475 
-- 1.14: 336 355 416 
-- 2.5: 324 344 402 411 442 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 11882 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Twilight Master
-- mangos: 300 
-- 1.13: 305 364 383 413 437 460 
-- 1.14: 315 325 361 361 387 391 401 404 408 409 414 444 454 460 473 479 482
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 11883 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Gogger Rock Keeper
-- mangos: 300 
-- 1.13: 318 323 357 455 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 11915 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Imelda
-- mangos: 375 
-- 1.14: 376 411 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 11916 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Gogger Geomancer
-- mangos: 300 
-- 1.13: 439 455 482 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 11917 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Gogger Stonepounder
-- mangos: 300 
-- 1.13: 305 346 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 11918 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Meliri
-- mangos: 300 
-- 1.14: 340 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 12024 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Tukk
-- mangos: 300 
-- 2.5: 454 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 12027 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Lah'Mawhani
-- mangos: 300 
-- 2.5: 370 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 12028 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Gor'marok the Ravager
-- mangos: 300 
-- 1.13: 873 
-- 1.14: 875 
-- 2.5: 800 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 12046 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Tortured Druid
-- mangos: 300 
-- 1.14: 315 337 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 12178 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Tortured Sentinel
-- mangos: 300 
-- 1.14: 318 325 372 383 482 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 12179 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Innkeeper Kaylisk
-- mangos: 300 
-- 2.5: 332 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 12196 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Spirit of Gelk
-- mangos: 550 
-- 1.13: 803 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 12239 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Spirit of Kolk
-- mangos: 550 
-- 1.13: 934 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 12240 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Melizza Brimbuzzle
-- mangos: 300 
-- 1.14: 352 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 12277 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Quel'Lithien Protector
-- mangos: 345 
-- 1.13: 118 123 
-- 1.14: 136 167 
-- 2.5: 116 116 118 135 
UPDATE `creature` SET `spawntimesecsmin`=120, `spawntimesecsmax`=180 WHERE 12322 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Wailing Spectre
-- mangos: 600 
-- 1.13: 337 340 429 460 478 
-- 2.5: 315 321 332 360 377 382 385 426 447 448 457 474
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 12377 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Damned Soul
-- mangos: 600 
-- 1.13: 425 450 478
-- 2.5: 319 344 347 350 360 385 405 447 472
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 12378 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Unliving Caretaker
-- mangos: 600 
-- 1.13: 338 373 402 416 
-- 2.5: 302 330 338 344 347 356 373 389 401 410 430 456 467 467 484
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 12379 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Unliving Resident
-- mangos: 600 
-- 1.13: 381 415 423 430
-- 2.5: 303 304 334 350 414 421 431 443 470
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 12380 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Ley Sprite
-- mangos: 340 480 
-- 1.14: 345 350 375 429 478 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 12381 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Guard Roberts
-- mangos: 60 
-- 2.5: 32 
UPDATE `creature` SET `spawntimesecsmin`=30, `spawntimesecsmax`=30 WHERE 12423 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Deathguard Kel
-- mangos: 60 
-- 2.5: 36 
UPDATE `creature` SET `spawntimesecsmin`=30, `spawntimesecsmax`=30 WHERE 12428 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Blackwing Taskmaster
-- mangos: 720 
-- 1.13: 719 723 725 734 739 742 745 755 764 847 853 862 877 883 892 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 12458 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Death Talon Hatcher
-- mangos: 720 
-- 1.13: 623 641 646 670 676 682 682 695 751 762 824 845 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 12468 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Melris Malagan
-- mangos: 25 
-- 1.14: 376 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 12480 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Justine Demalier
-- mangos: 430 
-- 1.14: 329 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 12481 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Senani Thunderheart
-- mangos: 300 
-- 2.5: 366 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 12696 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Muglash
-- mangos: 300 
-- 1.14: 61 63 
-- 2.5: 65 
UPDATE `creature` SET `spawntimesecsmin`=60, `spawntimesecsmax`=65 WHERE 12717 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Vera Nightshade
-- mangos: 300 
-- 2.5: 418 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 12722 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Pixel
-- mangos: 300 
-- 2.5: 462 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 12724 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Splintertree Raider
-- mangos: 900 
-- 1.14: 318 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 12859 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Ertog Ragetusk
-- mangos: 300 
-- 2.5: 310 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 12877 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Splintertree Guard
-- mangos: 300 
-- 1.14: 305 
-- 2.5: 314 317 443 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 12903 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Doctor Gregory Victor
-- mangos: 400 
-- 2.5: 16 19 
UPDATE `creature` SET `spawntimesecsmin`=15, `spawntimesecsmax`=20 WHERE 12920 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Doctor Gustaf VanHowzen
-- mangos: 360 
-- 2.5: 16 
UPDATE `creature` SET `spawntimesecsmin`=15, `spawntimesecsmax`=20 WHERE 12939 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Nipsy
-- mangos: 180 
-- 2.5: 6 
UPDATE `creature` SET `spawntimesecsmin`=5, `spawntimesecsmax`=5 WHERE 13018 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Burning Blade Seer
-- mangos: 300 
-- 1.13: 429 463 
-- 1.14: 426 462 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 13019 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Gaelden Hammersmith
-- mangos: 120 
-- 1.13: 300 
-- 1.14: 319 373 440 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 13216 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Murgot Deepforge
-- mangos: 120 
-- 1.14: 905 946 968 975 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 13257 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Frog
-- mangos: 7200 
-- 1.13: 127 182 192 
-- 1.14: 123 
-- 2.5: 139 139
UPDATE `creature` SET `spawntimesecsmin`=120, `spawntimesecsmax`=180 WHERE 13321 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Sagorne Creststrider
-- mangos: 300 
-- 2.5: 323 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 13417 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Royal Dreadguard
-- mangos: 900 
-- 1.13: 334 
-- 1.14: 313 315 321 333 339 347 348 394 439 466
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 13839 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Steeljaw Snapper
-- mangos: 300 
-- 1.13: 341 384 389 402 403 415 461 470
-- 1.14: 303 343 390 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 14123 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Kor'kron Elite
-- mangos: 300 
-- 2.5: 311 350 352 353 377 406 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 14304 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Seeker Thompson
-- mangos: 900 
-- 1.14: 428 443 447 453 457 467 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 14404 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Silverwing Elite
-- mangos: 600 
-- 2.5: 341 448 452 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 14715 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- High Overlord Saurfang
-- mangos: 25 600 
-- 1.14: 721 
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=720 WHERE 14720 IN (id, id2, id3, id4, id5) && `patch_max`=10 && `spawntimesecsmax`=600;


-- Field Marshal Afrasiabi
-- mangos: 180 
-- 1.13: 437 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 14721 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Mistina Steelshield
-- mangos: 310 
-- 2.5: 448 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 14723 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Ralston Farnsley
-- mangos: 300 
-- 1.13: 424 
-- 1.14: 385 406 413 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 14729 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Revantusk Watcher
-- mangos: 350 
-- 1.14: 320 332 
-- 2.5: 405 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 14730 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Otho Moji'ko
-- mangos: 350 
-- 2.5: 361 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 14738 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Huntsman Markhor
-- mangos: 350 
-- 2.5: 410 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 14741 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Captured Hakkari Zealot
-- mangos: 60 
-- 1.13: 30 30 30 30 30 30 31 31 31 31 31 31 31 31 31 31 31 31 32 32 33 33 33 33 33 33 33 34 34 34 34 34 35 35 
UPDATE `creature` SET `spawntimesecsmin`=30, `spawntimesecsmax`=35 WHERE 14912 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- League of Arathor Emissary
-- mangos: 120 300 
-- 2.5: 416 420 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 14991 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Twilight Flamereaver
-- mangos: 300 
-- 1.14: 330 483 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 15201 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Horde Warbringer
-- mangos: 25 120 250 300 
-- 1.13: 418 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 15350 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Ironforge Brigade Rifleman
-- mangos: 300 
-- 2.5: 63 63 
UPDATE `creature` SET `spawntimesecsmin`=60, `spawntimesecsmax`=65 WHERE 15441 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Arcanist Nozzlespring
-- mangos: 600 
-- 2.5: 63 
UPDATE `creature` SET `spawntimesecsmin`=60, `spawntimesecsmax`=65 WHERE 15444 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Minion of Omen
-- mangos: 300 
-- 1.14: 336 387 397 418 419 425 431 436 460 463 465 467
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 15466 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Beetle
-- mangos: 25 
-- 1.13: 375 413 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 15475 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Cenarion Outrider
-- mangos: 300 
-- 1.13: 316 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 15545 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Shadow Priestess Shai
-- mangos: 600 
-- 2.5: 65 
UPDATE `creature` SET `spawntimesecsmin`=60, `spawntimesecsmax`=65 WHERE 15615 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Orgrimmar Legion Grunt
-- mangos: 600 
-- 2.5: 62 63 
UPDATE `creature` SET `spawntimesecsmin`=60, `spawntimesecsmax`=65 WHERE 15616 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Orgrimmar Legion Axe Thrower
-- mangos: 600 
-- 2.5: 65 
UPDATE `creature` SET `spawntimesecsmin`=60, `spawntimesecsmax`=65 WHERE 15617 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Auctioneer Stockton
-- mangos: 300 
-- 1.13: 336 
-- 1.14: 332 465 
-- 2.5: 362 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 15675 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Auctioneer Yarly
-- mangos: 300 
-- 1.14: 466 
-- 2.5: 457 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 15676 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Auctioneer Cain
-- mangos: 300 
-- 1.14: 329 396 420 448 
-- 2.5: 477 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 15682 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Auctioneer Naxxremis
-- mangos: 300 
-- 1.14: 412 
-- 2.5: 324 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 15683 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Auctioneer Tricket
-- mangos: 300 
-- 2.5: 482 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 15684 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Southsea Kidnapper
-- mangos: 180 
-- 2.5: 481 481 488 
UPDATE `creature` SET `spawntimesecsmin`=480, `spawntimesecsmax`=480 WHERE 15685 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Auctioneer Rhyker
-- mangos: 300 
-- 2.5: 335 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 15686 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Dark Iron Kidnapper
-- mangos: 180 
-- 1.14: 340 344 360 396 406 432 436 450 459 469 469 489
-- 2.5: 468 468 468 478 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 15692 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Winter Reveler
-- mangos: 300 480 
-- 1.14: 335 393 410 420 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 15760 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Officer Thunderstrider
-- mangos: 250 
-- 2.5: 406 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 15767 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Officer Gothena
-- mangos: 300 
-- 1.13: 361 
-- 1.14: 304 310 310 312 327 329 357 441 442 444 451 469 474 477 485 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 15768 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Tauren Rifleman
-- mangos: 25 
-- 1.14: 322 329 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 15855 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Maggot
-- mangos: 7200 
-- 1.13: 720 746 798 920 
-- 1.14: 747 777 797 807 841 883
UPDATE `creature` SET `spawntimesecsmin`=720, `spawntimesecsmax`=960 WHERE 16030 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Magma Lord Bokk
-- mangos: 500 
-- 1.14: 124 
-- 2.5: 120 
UPDATE `creature` SET `spawntimesecsmin`=120, `spawntimesecsmax`=120 WHERE 16043 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Argent Recruiter
-- mangos: 120 
-- 1.13: 304 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=300 WHERE 16241 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Skeletal Soldier
-- mangos: 120 
-- 1.14: 309 320 326 328 329 331 341 343 346 350 354 358 359 359 361 366 367 367 368 370 375 376 379 385 387 390 395 397 403 404 406 409 414 416 423 439 441 444 448 450 452 456 457 459 464 472 473 477 478 481 484 486
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 16422 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Spectral Apparition
-- mangos: 120 
-- 1.14: 350 353 362 364 364 369 373 377 378 379 381 383 384 388 390 400 401 403 404 405 407 407 408 409 409 413 413 413 413 415 415 416 418 419 423 423 425 425 426 427 427 428 431 431 434 435 435 436 437 437 438 438 438 441 441 444 444 444 445 447 452 453 460 462 469 475 475 478 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 16423 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Spectral Spirit
-- mangos: 120 
-- 1.14: 301 303 306 307 309 310 316 316 318 318 321 323 325 325 326 328 328 328 331 331 332 334 336 336 337 338 338 340 340 342 345 346 346 349 350 350 352 358 359 362 363 364 364 366 366 369 370 370 374 375 379 380 381 382 382 386 387 387 388 388 389 390 392 392 393 394 396 397 397 397 397 397 397 400 401 401 401 401 402 403 403 404 404 405 405 406 407 407 408 408 410 411 411 412 413 415 416 417 418 418 422 422 422 424 424 425 425 426 428 428 429 429 430 431 431 433 433 434 435 436 436 438 439 439 439 441 441 441 442 444 444 445 446 446 447 447 450 451 452 454 454 456 458 458 459 459 463 463 463 464 464 465 466 467 468 469 469 470 471 471 472 472 473 474 474 475 477 478 478 478 479 479 479 481 482 482 484 484 484 485 486 487 487 488
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 16437 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Skeletal Trooper
-- mangos: 120 
-- 1.14: 304 305 309 316 318 321 323 323 325 327 327 330 333 334 335 336 339 339 341 345 348 348 348 351 351 353 353 355 357 358 359 362 362 364 364 365 367 369 371 371 371 371 373 376 376 379 380 381 382 383 384 384 384 387 388 388 389 389 390 391 391 391 391 392 392 392 394 394 395 395 395 396 397 397 397 397 398 399 400 401 402 403 405 405 406 406 411 412 413 414 414 414 416 419 420 420 421 421 421 423 424 424 425 426 426 426 428 428 429 429 430 431 431 432 433 433 434 434 434 434 436 436 438 438 438 439 439 440 440 440 441 441 444 445 446 446 447 448 448 449 450 450 452 452 453 454 454 455 456 457 458 459 459 460 461 461 462 462 462 464 464 464 466 467 467 469 469 471 471 471 471 473 474 475 475 479 480 481 483 484 485 486 486 486 488
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 16438 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Apothecary Quinard
-- mangos: 300 
-- 2.5: 361 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 17070 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- General Kirika
-- mangos: 300 
-- 2.5: 409 
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=480 WHERE 17079 IN (id, id2, id3, id4, id5) && `patch_max`=10;


-- Other normal starting zone mobs without data should likely respawn in 3 minutes.
UPDATE `creature` SET `spawntimesecsmin`=180, `spawntimesecsmax`=180 WHERE `id` IN (704, 705, 706, 707, 708, 724, 946, 1501, 1502, 1505, 1508, 1509, 1512, 1513, 1688, 1985, 1988, 1989, 2961, 3101) && `spawntimesecsmin` > 15;


-- Other named quest drop starting zone mobs without data should likely respawn in 1 minute.
UPDATE `creature` SET `spawntimesecsmin`=60, `spawntimesecsmax`=65 WHERE `id` IN (3183, 3281);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
