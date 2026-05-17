-- 名片管理系统 数据库初始化脚本
-- 数据库名称：mybatis

-- 用户表
CREATE TABLE IF NOT EXISTS `usertable` (
    `id` INT PRIMARY KEY AUTO_INCREMENT COMMENT '用户ID',
    `username` VARCHAR(50) NOT NULL COMMENT '用户名',
    `password` VARCHAR(100) NOT NULL COMMENT '密码(MD5加密)',
    `addTime` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
    UNIQUE KEY `uk_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- 名片表
CREATE TABLE IF NOT EXISTS `cardtable` (
    `id` INT PRIMARY KEY AUTO_INCREMENT COMMENT '名片ID',
    `name` VARCHAR(50) NOT NULL COMMENT '姓名',
    `company` VARCHAR(100) DEFAULT NULL COMMENT '公司',
    `position` VARCHAR(50) DEFAULT NULL COMMENT '职位',
    `phone` VARCHAR(20) NOT NULL COMMENT '电话',
    `email` VARCHAR(100) DEFAULT NULL COMMENT '邮箱',
    `address` VARCHAR(200) DEFAULT NULL COMMENT '地址',
    `logo` VARCHAR(200) DEFAULT NULL COMMENT 'Logo图片路径',
    `type` VARCHAR(20) DEFAULT NULL COMMENT '名片类型(客户/供应商/朋友/同事/其他)',
    `userId` INT NOT NULL COMMENT '所属用户ID',
    `addTime` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
    KEY `idx_userId` (`userId`),
    CONSTRAINT `fk_card_user` FOREIGN KEY (`userId`) REFERENCES `usertable` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='名片表';

-- 插入默认管理员用户（密码：123456的MD5值）
INSERT INTO `usertable` (`username`, `password`, `addTime`)
VALUES ('admin', 'e10adc3949ba59abbe56e057f20f883e', NOW());

-- 插入示例名片数据
INSERT INTO `cardtable` (`name`, `company`, `position`, `phone`, `email`, `address`, `type`, `userId`, `addTime`)
VALUES
('张三', '阿里巴巴', '技术经理', '13800138001', 'zhangsan@alibaba.com', '杭州市余杭区文一西路969号', '客户', 1, NOW()),
('李四', '腾讯科技', '产品总监', '13800138002', 'lisi@tencent.com', '深圳市南山区科技中一路', '供应商', 1, NOW()),
('王五', '百度公司', '高级工程师', '13800138003', 'wangwu@baidu.com', '北京市海淀区上地十街', '同事', 1, NOW()),
('赵六', '字节跳动', '运营主管', '13800138004', 'zhaoliu@bytedance.com', '北京市海淀区知春路', '朋友', 1, NOW()),
('孙七', '华为技术', '销售总监', '13800138005', 'sunqi@huawei.com', '深圳市龙岗区坂田华为基地', '客户', 1, NOW());
