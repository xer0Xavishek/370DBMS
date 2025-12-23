-- Add columns for Admin Dispute System
ALTER TABLE `user` ADD COLUMN `warning_count` INT DEFAULT 0;
ALTER TABLE `user` ADD COLUMN `is_suspended` BOOLEAN DEFAULT FALSE;
