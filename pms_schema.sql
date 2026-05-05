-- Reverse engineered database schema for the Property Management System
-- The original codebase included a Hospital Management System database dump instead.

CREATE TABLE IF NOT EXISTS `property` (
  `property_id` int(11) NOT NULL AUTO_INCREMENT,
  `property_type` varchar(255) DEFAULT NULL,
  `property_name` varchar(255) DEFAULT NULL,
  `frequency` varchar(255) DEFAULT NULL,
  `unit` int(11) DEFAULT NULL,
  `tarea` varchar(255) DEFAULT NULL,
  `tarea_munit` varchar(255) DEFAULT NULL,
  `property_address` text,
  `city` varchar(255) DEFAULT NULL,
  `property_country` varchar(255) DEFAULT NULL,
  `property_province` varchar(255) DEFAULT NULL,
  `zip_code` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`property_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `p_project` (
  `project_id` int(11) NOT NULL AUTO_INCREMENT,
  `property_address` int(11) DEFAULT NULL,
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `p_landlord` (
  `landlord_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `dob` varchar(255) DEFAULT NULL,
  `contact_no` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` text,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip_code` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`landlord_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `unit` (
  `unit_id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_name` varchar(255) DEFAULT NULL,
  `unit_type` varchar(255) DEFAULT NULL,
  `property_name` int(11) DEFAULT NULL,
  `floor_number` varchar(255) DEFAULT NULL,
  `bedrooms` int(11) DEFAULT NULL,
  `bathrooms` int(11) DEFAULT NULL,
  `trent` varchar(255) DEFAULT NULL,
  `trent_period` varchar(255) DEFAULT NULL,
  `vacant_status` int(11) DEFAULT '0',
  PRIMARY KEY (`unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `p_appinfo` (
  `appinfo_id` int(11) NOT NULL AUTO_INCREMENT,
  `property_name` int(11) DEFAULT NULL,
  `movein_date` varchar(255) DEFAULT NULL,
  `no_of_bedroom` int(11) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `ssn` varchar(255) DEFAULT NULL,
  `dob` varchar(255) DEFAULT NULL,
  `drivinglicense` varchar(255) DEFAULT NULL,
  `drivinglicensestate` varchar(255) DEFAULT NULL,
  `rent_status` int(11) DEFAULT '0',
  `application_date` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`appinfo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `p_empinfo` (
  `empinfo_id` int(11) NOT NULL AUTO_INCREMENT,
  `appinfo_id` int(11) DEFAULT NULL,
  `emp_name` varchar(255) DEFAULT NULL,
  `job_type` varchar(255) DEFAULT NULL,
  `emp_address` text,
  `emp_aphone` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `sup_name` varchar(255) DEFAULT NULL,
  `job_duration` varchar(255) DEFAULT NULL,
  `monthly_income` varchar(255) DEFAULT NULL,
  `other_income` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`empinfo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `p_rentalhistory` (
  `rentalhistory_id` int(11) NOT NULL AUTO_INCREMENT,
  `appinfo_id` int(11) DEFAULT NULL,
  `cur_address` text,
  `curjobyear` varchar(255) DEFAULT NULL,
  `cur_renamnt` varchar(255) DEFAULT NULL,
  `cur_resleaving` text,
  `curlname` varchar(255) DEFAULT NULL,
  `for_address` text,
  `forresyear` varchar(255) DEFAULT NULL,
  `for_renamnt` varchar(255) DEFAULT NULL,
  `for_resleaving` text,
  `forlname` varchar(255) DEFAULT NULL,
  `forland_phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rentalhistory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `p_givinganswer` (
  `givinganswer_id` int(11) NOT NULL AUTO_INCREMENT,
  `appinfo_id` int(11) DEFAULT NULL,
  `dec_bankrupcy` varchar(255) DEFAULT NULL,
  `evicted_residence` varchar(255) DEFAULT NULL,
  `rental_due` varchar(255) DEFAULT NULL,
  `refused_rent` varchar(255) DEFAULT NULL,
  `con_felony` varchar(255) DEFAULT NULL,
  `sex_offence` varchar(255) DEFAULT NULL,
  `drug_crime` varchar(255) DEFAULT NULL,
  `parole` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`givinganswer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `p_rentformother` (
  `rentformother_id` int(11) NOT NULL AUTO_INCREMENT,
  `appinfo_id` int(11) DEFAULT NULL,
  `ref1_name` varchar(255) DEFAULT NULL,
  `ref1phone` varchar(255) DEFAULT NULL,
  `ref1relation` varchar(255) DEFAULT NULL,
  `ref2_name` varchar(255) DEFAULT NULL,
  `ref2phone` varchar(255) DEFAULT NULL,
  `ref2relation` varchar(255) DEFAULT NULL,
  `emrcontactname` varchar(255) DEFAULT NULL,
  `emr_contactnumber` varchar(255) DEFAULT NULL,
  `emr_contactrel` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rentformother_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `p_tenant` (
  `tenant_id` int(11) NOT NULL AUTO_INCREMENT,
  `appinfo_id` int(11) DEFAULT NULL,
  `tenant_name` varchar(255) DEFAULT NULL,
  `tenant_contact` varchar(255) DEFAULT NULL,
  `property_name` int(11) DEFAULT NULL,
  `frequency` varchar(255) DEFAULT NULL,
  `vacant_unit` int(11) DEFAULT NULL,
  `tenantStatus` int(11) DEFAULT '0',
  PRIMARY KEY (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `p_lease` (
  `leaseId` int(11) NOT NULL AUTO_INCREMENT,
  `tenantId` int(11) DEFAULT NULL,
  `moveinDate` date DEFAULT NULL,
  `moveoutDate` date DEFAULT NULL,
  `property_name` int(11) DEFAULT NULL,
  `frequency` varchar(255) DEFAULT NULL,
  `vacant_unit` int(11) DEFAULT NULL,
  `latefee_rule` varchar(255) DEFAULT NULL,
  `rentAmount` varchar(255) DEFAULT NULL,
  `LeaseDate` varchar(255) DEFAULT NULL,
  `InitialTotalPayment` varchar(255) DEFAULT NULL,
  `terminationStatus` int(11) DEFAULT '0',
  `leaseStatus` int(11) DEFAULT '0',
  `renewalStatus` int(11) DEFAULT '0',
  `isAppliedLate` int(11) DEFAULT '0',
  `lateFee` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`leaseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `p_leasedetails` (
  `leasedetails_id` int(11) NOT NULL AUTO_INCREMENT,
  `leaseId` int(11) DEFAULT NULL,
  `personal_property` text,
  `addenda` text,
  `EarnestMoneyReceipt` varchar(255) DEFAULT NULL,
  `FormMoneyReceipt` varchar(255) DEFAULT NULL,
  `IsPetAllowed` varchar(255) DEFAULT NULL,
  `keys` text,
  `PetInsurance` varchar(255) DEFAULT NULL,
  `Utilities` text,
  `PoolChemicals` varchar(255) DEFAULT NULL,
  `PoolMaintenance` varchar(255) DEFAULT NULL,
  `FrontYard` varchar(255) DEFAULT NULL,
  `BackYard` varchar(255) DEFAULT NULL,
  `PestControl` varchar(255) DEFAULT NULL,
  `Other` varchar(255) DEFAULT NULL,
  `HoaFees` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`leasedetails_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `p_tenant_bill` (
  `tenant_bill_id` int(11) NOT NULL AUTO_INCREMENT,
  `InvId` varchar(255) DEFAULT NULL,
  `PropertyId` int(11) DEFAULT NULL,
  `TenantId` int(11) DEFAULT NULL,
  `LeaseId` int(11) DEFAULT NULL,
  `UnitId` int(11) DEFAULT NULL,
  `Attention` varchar(255) DEFAULT NULL,
  `PaymentHeadId` int(11) DEFAULT NULL,
  `RefNo` varchar(255) DEFAULT NULL,
  `moveinDate` date DEFAULT NULL,
  `EnteredBy` varchar(255) DEFAULT NULL,
  `Entrydate` date DEFAULT NULL,
  `TotalPrice` varchar(255) DEFAULT NULL,
  `BalanceAmount` varchar(255) DEFAULT NULL,
  `invStatus` int(11) DEFAULT '0',
  PRIMARY KEY (`tenant_bill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `work_order` (
  `wo_id` int(11) NOT NULL AUTO_INCREMENT,
  `contractor` varchar(255) DEFAULT NULL,
  `PropertyId` int(11) DEFAULT NULL,
  `JobTitle` varchar(255) DEFAULT NULL,
  `JobDescription` text,
  `Material1Cost` varchar(255) DEFAULT NULL,
  `Material1Description` text,
  `Labor1Charge` varchar(255) DEFAULT NULL,
  `isWorkDone` varchar(255) DEFAULT NULL,
  `Notes` text,
  `Material2Cost` varchar(255) DEFAULT NULL,
  `Material2Description` text,
  `Labor2Charge` varchar(255) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `isAuthorized` varchar(255) DEFAULT NULL,
  `isPaid` varchar(255) DEFAULT NULL,
  `datePaid` date DEFAULT NULL,
  PRIMARY KEY (`wo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `p_maintenance_log` (
  `maintenance_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `contractor` varchar(255) DEFAULT NULL,
  `PropertyId` int(11) DEFAULT NULL,
  `UnitName` varchar(255) DEFAULT NULL,
  `Category` varchar(255) DEFAULT NULL,
  `MaintenanceTitle` varchar(255) DEFAULT NULL,
  `Description` text,
  `when_done` date DEFAULT NULL,
  `Notes` text,
  `user` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`maintenance_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `p_termination` (
  `termination_id` int(11) NOT NULL AUTO_INCREMENT,
  `leavingDate` date DEFAULT NULL,
  `leavingReason` text,
  `leaseId` int(11) DEFAULT NULL,
  PRIMARY KEY (`termination_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `p_lease_renew` (
  `lease_renew_id` int(11) NOT NULL AUTO_INCREMENT,
  `moveinDate` date DEFAULT NULL,
  `moveoutDate` date DEFAULT NULL,
  `leaseId` int(11) DEFAULT NULL,
  `renewalDate` date DEFAULT NULL,
  PRIMARY KEY (`lease_renew_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `p_payment_head_setting` (
  `head_id` int(11) NOT NULL AUTO_INCREMENT,
  `head_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`head_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `accounts_ledger` (
  `ledger_id` int(11) NOT NULL AUTO_INCREMENT,
  `ledger_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ledger_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `p_late_fee_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fee_frequency` int(11) DEFAULT NULL,
  `fee_amount` varchar(255) DEFAULT NULL,
  `fee_ratio` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `p_quick_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `website_title` varchar(255) DEFAULT NULL,
  `quick_links` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `pass_storer` (
  `storer_id` int(11) NOT NULL AUTO_INCREMENT,
  `storer_for` varchar(255) DEFAULT NULL,
  `site` varchar(255) DEFAULT NULL,
  `name_status` varchar(255) DEFAULT NULL,
  `address_on_file` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `account` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`storer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `p_marketing` (
  `marketing_id` int(11) NOT NULL AUTO_INCREMENT,
  `marketingName` varchar(255) DEFAULT NULL,
  `postingTitle` varchar(255) DEFAULT NULL,
  `description` text,
  `shortDescription` text,
  `propertyName` varchar(255) DEFAULT NULL,
  `vacantUnit` int(11) DEFAULT NULL,
  `availableDate` date DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `featuredRental` varchar(255) DEFAULT NULL,
  `published` varchar(255) DEFAULT NULL,
  `forsale` varchar(255) DEFAULT NULL,
  `AllowPets` varchar(255) DEFAULT NULL,
  `AllowSmoking` varchar(255) DEFAULT NULL,
  `imageUpload` varchar(255) DEFAULT NULL,
  `uploadBy` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`marketing_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `noticeboard` (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT,
  `notice_title` longtext NOT NULL,
  `notice` longtext NOT NULL,
  `create_timestamp` int(11) NOT NULL,
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- Missing tables for the Property Management System

-- Language table
CREATE TABLE IF NOT EXISTS `language` (
  `phrase_id` int(11) NOT NULL AUTO_INCREMENT,
  `phrase` longtext COLLATE utf8_unicode_ci NOT NULL,
  `english` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`phrase_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Settings table
CREATE TABLE IF NOT EXISTS `settings` (
  `settings_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`settings_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Admin table
CREATE TABLE IF NOT EXISTS `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `email` longtext COLLATE utf8_unicode_ci NOT NULL,
  `password` longtext COLLATE utf8_unicode_ci NOT NULL,
  `level` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Initial data for settings
INSERT INTO `settings` (`type`, `description`) VALUES ('system_name', 'Property Management System');
INSERT INTO `settings` (`type`, `description`) VALUES ('system_title', 'PMS Admin');
INSERT INTO `settings` (`type`, `description`) VALUES ('system_email', 'admin@example.com');
INSERT INTO `settings` (`type`, `description`) VALUES ('address', '123 Main St, City, Country');
INSERT INTO `settings` (`type`, `description`) VALUES ('phone', '555-0199');
INSERT INTO `settings` (`type`, `description`) VALUES ('paypal_email', 'paypal@example.com');
INSERT INTO `settings` (`type`, `description`) VALUES ('currency', 'USD');

-- Initial data for admin
INSERT INTO `admin` (`name`, `email`, `password`, `level`) VALUES ('Admin User', 'admin@example.com', 'admin', 1);

-- Initial data for language
INSERT INTO `language` (`phrase`, `english`) VALUES ('admin_dashboard', 'Admin Dashboard');
INSERT INTO `language` (`phrase`, `english`) VALUES ('login', 'Login');
INSERT INTO `language` (`phrase`, `english`) VALUES ('settings', 'Settings');
INSERT INTO `language` (`phrase`, `english`) VALUES ('system_settings', 'System Settings');
INSERT INTO `language` (`phrase`, `english`) VALUES ('manage_language', 'Manage Language');
INSERT INTO `language` (`phrase`, `english`) VALUES ('dashboard', 'Dashboard');
INSERT INTO `language` (`phrase`, `english`) VALUES ('manage_landlord', 'Manage Landlord');
INSERT INTO `language` (`phrase`, `english`) VALUES ('manage_property', 'Manage Property');
INSERT INTO `language` (`phrase`, `english`) VALUES ('manage_unit', 'Manage Unit');
INSERT INTO `language` (`phrase`, `english`) VALUES ('rental_application', 'Rental Application');
INSERT INTO `language` (`phrase`, `english`) VALUES ('rental_application_list', 'Rental Application List');
INSERT INTO `language` (`phrase`, `english`) VALUES ('manage_lease', 'Manage Lease');
INSERT INTO `language` (`phrase`, `english`) VALUES ('tenant_list', 'Tenant List');
INSERT INTO `language` (`phrase`, `english`) VALUES ('work_order', 'Work Order');
INSERT INTO `language` (`phrase`, `english`) VALUES ('maintenance_log', 'Maintenance Log');
INSERT INTO `language` (`phrase`, `english`) VALUES ('active_lease', 'Active Lease');
INSERT INTO `language` (`phrase`, `english`) VALUES ('settings_updated', 'Settings Updated');
INSERT INTO `language` (`phrase`, `english`) VALUES ('login_failed', 'Login Failed');
INSERT INTO `language` (`phrase`, `english`) VALUES ('logged_out', 'Logged Out');
