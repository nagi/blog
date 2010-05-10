-- MySQL dump 10.13  Distrib 5.1.37, for debian-linux-gnu (i486)
--
-- Host: localhost    Database: blog_development
-- ------------------------------------------------------
-- Server version	5.1.37-1ubuntu5.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `post_date` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'A More Flash Bash?','Are you a Ubuntu user suffering from \"terminal envy\" after seeing the default Mint gnome terminal?\r\n\r\n!/images/mint_bash_fade.png(Mint bash terminal)!\r\n\r\nThe following \"file\":files/.bashrc is lifted from my friends Mint installation.\r\n\r\nEither put it into your home directory or merge it into your /etc/bash.bashrc to get:\r\n* A groovy prompt.\r\n* Colourful grep output.\r\n* A novel fortune.\r\n\r\n','2010-02-20 00:00:00','2010-03-05 16:53:18','2010-03-08 14:00:35'),(2,'Hacking Your Virgin Router','Virgin Media are becoming the most popular ISP here in the UK thanks to reasnoble prices and great speed.\r\n\r\nUnfortunately, those who signed up around a year ago will have been supplied with a router from virgin (the Netgear WGR614v9) which contains an old and buggy firmware. These poor souls will experience annoying disconnections, and anomalies when trying to use the wireless features of this router.\r\n\r\n!/images/wgr614.jpg(Locked down router)!\r\n\r\nNormally this kind of thing isn\'t a problem for the tech savvy user who will attempt to update the routers firmware, but these users will soon discover that the silly sausages at Virgin locked the router down so you can not flash an updated firmware. Whoops! What an epic brain fart.\r\n\r\nIt never ceases to amaze me how big hi-tech companies can make such silly decisions. I just can\'t seem to fathom the business case for freezing a firmware at an early version. I guess it is unreasonable to expect a company to make great decisions all the time, in the same way it is unreasonable to expect this of an individual, but Virgin can consider themselves lucky that only a small subset of users has been effected by problems, and a complete recall was not required. They also narrowly avoided having the FSF camped outside their head office dressed as Penguins singing the Free Software Song. God bless\'em.\r\n\r\nIf you have followed \"this guide\":http://forum1.netgear.com/showpost.php?p=146285&postcount=1 and are still failing to upgrade your router because of an message in you\'re browser saying \"Invalid filename was provided, please enter again.\" then you can either try I.E. if you are running Windows, or for Firefox users:\r\n\r\n* Install the firebug add-on for Firefox\r\n* Set a breakpoint point at the beginning of the checkData() function. \r\n* Click the upload button.\r\n* Step through the code until the file path you entered in the input box is assigned to a variable.\r\n* Correct the filepath in the variable to the absolute file path to your firmware binary.\r\n* Make sure the function returns true.\r\n* Step out of the code.\r\n\r\nLessons learned? I\'m going to make sure my next router will run \"dd-wrt\":http://www.dd-wrt.com/site/index','2010-03-08 00:00:00','2010-03-08 14:23:05','2010-03-08 15:37:05'),(3,'PXE Booting on Windows','Are you installing Windows on a laptop with a broken CD ROM or a netbook? Do you need to boot a DOS prompt on a machine without a floppy drive (maybe to take a disk image using ghost.exe)? Do you need build a 200 clients? Do you have to run memtest on every workstation in your estate? If so maybe you could use a PXE boot server in your lab.\r\n\r\n*Overview of PXE Booting*\r\nEither you or a small pixie will configure a client machines BIOS to enable network booting. The client will grab an IP address before any OS has loaded. It will also have grabbed both 1) address or name of a TFTP server 2) The name of a file containing a tiny about of boot code. It will suck the boot code from the TFTP server and execute it. This boot code will then load a more useful kernel and boot that... et voila. You just PXE Booted.\r\n!/images/pixie_boot.jpg(PXE Boot)!\r\n\r\n*Ingredients*\r\n* A TFTP server (I recommend \"pumpking\":http://kin.klever.net/pumpkin/)\r\n* A DHCP server (I like \"Dual Server\":http://sourceforge.net/projects/dhcp-dns-server/)\r\n* A DNS server _optional_ (You can use Dual Server if you want a DNS server)\r\n* An micro-kernel image to boot (I use pxelinux from the syslinux package) \r\n* A useful floppy disk image to chainload (Perhaps \"BARTS Network Disk\":http://www.nu2.nu/bootdisk/network/ or \"Damn Small Linux\":http://www.damnsmalllinux.org/)\r\n\r\n*Before You Start*\r\nIf you are reading or writing disk images you will want to put this stuff on it\'s own LAN. You definitely don\'t want to image machines on the corporate LAN - it will likely grind to a crawl.\r\n\r\n*Recipe*\r\n# *Configure DHCP Server*\r\nConfigure all the usual stuff plus:\r\nOption 66 - Next Server (make this the name or IP of your TFTP server)\r\nOption 67 - Bootfile name (this will probably be \"pxelinux.0\").\r\nI recommend that you test this component on in isolation before moving on.\r\n# *Configure DNS Server*\r\nMake sure this is resolving names as you would expect, or just use IP Addresses everywhere and save yourself the ball ache of running a DNS server at all.\r\n# *Get a network disk*\r\nTo keep things easy to start with, I recommend starting with a simple DOS boot disk image. The image file will probably end in @.IMG@ - \"www.allbootdisks.com\":www.allbootdisks.com. Windows users will need to install 3rd party software to edit these raw disk images (I believe winimage has a free trial). Linux users can smugly just @mount -o loop ~/images/DOS622.IMG /mnt/virtual_floppy@\r\nBarts Network Disk is the mother of all DOS Bootdisks. It supports most network cards, note that you must compile it with the right driver plugins for your network cards.\r\nAs always, make sure you test this component in isolation by burning it to a floppy and checking it does what you need.\r\n# *Configure pxelinux*\r\nGrab pxelinux from the syslinux package and configure as per the docs.\r\n# *Configure Your TFTP Server*\r\nYou need to ensure that a request to your TFTP server for the file \"pxelinux.0\" is correctly resolved. Test this in isolation with a tftp client if you have any doubt.\r\nEverything you learn about TFTP will be usefull if you work with Cisco kit in the future\r\n\r\n*Conclusion*\r\nI have found it useful to have a laptop I can carry around as an imaging vacuum. I link the laptop to the target with a crossover cable, and just suck up an image. The time I\'ve spent configuring the laptop for PXE pays back quickly.\r\n\r\nTips\r\n* If your imaging a machine over the network, compressing the image is always quicker then not compressing the image.\r\n* You can avoid proprietary disk imaging tools all together on non-windows based operating systems by chaining the GNU tools dd, gzip & nc providing that disk geometry\'s don\'t vary. Just be a bit careful when using dd.\r\n* I\'ve set this kind of thing up on linux before - there are a few good tutorials / howto out there.\r\n* Watch out when cloning Windows boxes. You don\'t want to systems that share a SID (google it) and you may need to run sysprep to avoid WGA / WAT problems','2010-03-08 17:01:00','2010-03-08 18:00:17','2010-03-08 20:05:16');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20100305154822'),('20100305164758');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-03-11 15:33:13
