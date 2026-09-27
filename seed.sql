DROP TABLE IF EXISTS candidates;
CREATE TABLE candidates (
  id INTEGER PRIMARY KEY,
  gender TEXT,
  age INTEGER,
  education TEXT,
  city TEXT,
  work_years INTEGER,
  expected_position TEXT,
  salary_min INTEGER,
  salary_max INTEGER,
  work_status TEXT,
  online_status TEXT,
  score REAL,
  source TEXT,
  tags TEXT,
  status TEXT,
  created_at TEXT
);
CREATE INDEX idx_candidates_city ON candidates(city);
CREATE INDEX idx_candidates_education ON candidates(education);
INSERT INTO candidates VALUES (1,'male',33,'本科','上海',10,'工业设计',18000,25000,'','',NULL,'','工业设计,3C消费电子,个护小家电,外观设计,结构协同,量产跟进,注塑,吸塑,硅胶包胶,防水结构,磁吸充电,表面处理,Rhino,Keyshot,Creo','new','2026-08-03 10:11:10.249234+08');
INSERT INTO candidates VALUES (2,'male',0,'大专','嘉兴',14,'工业设计',11,15,'离职-正在找工作','3分钟前浏览过职位',NULL,'智联招聘','','candidate','2026-08-04 15:24:42.046034+08');
INSERT INTO candidates VALUES (3,'male',0,'硕士','浙江',18,'工业设计',1,2,'离职-正在找工作','10小时前在线',55,'智联招聘','','candidate','2026-08-04 15:24:42.051494+08');
INSERT INTO candidates VALUES (4,'female',0,'本科','嘉兴',4,'工业设计',10,20,'在职-看看机会','20天前浏览过职位',NULL,'智联招聘','','candidate','2026-08-04 15:24:42.059776+08');
INSERT INTO candidates VALUES (5,'male',0,'大专','嘉兴',21,'工业设计',6,12,'离职-正在找工作','5小时前浏览过职位',NULL,'智联招聘','','candidate','2026-08-04 15:24:42.065359+08');
INSERT INTO candidates VALUES (6,'male',0,'大专','嘉兴',23,'机械结构工程师',15,20,'在职-正在找工作','48小时前在线',NULL,'智联招聘','','candidate','2026-08-04 15:24:42.071043+08');
INSERT INTO candidates VALUES (7,'male',0,'本科','嘉兴',7,'工业设计',8,10,'在职-看看机会','半小时前活跃',NULL,'智联招聘','','candidate','2026-08-04 15:24:42.075839+08');
INSERT INTO candidates VALUES (8,'male',0,'本科','嘉兴',3,'工业设计',11,13,'在职-正在找工作','1天前浏览过职位',NULL,'智联招聘','','new','2026-08-04 15:24:42.086761+08');
INSERT INTO candidates VALUES (9,'female',0,'本科','浙江',4,'工业设计',7,14,'离职-正在找工作','3小时前有投递',NULL,'智联招聘','','candidate','2026-08-04 15:24:42.091588+08');
INSERT INTO candidates VALUES (10,'male',0,'大专','衡阳',35,'工业设计',0,0,'离职-正在找工作','18小时前活跃',NULL,'智联招聘','','candidate','2026-08-04 15:24:42.097427+08');
INSERT INTO candidates VALUES (11,'male',0,'大专','嘉兴',14,'机械工程师',14,15,'在职-正在找工作','3天前有回复',NULL,'智联招聘','','candidate','2026-08-04 15:24:42.102373+08');
INSERT INTO candidates VALUES (12,'male',0,'本科','浙江',5,'工业设计',8,14,'在职-看看机会','20小时前浏览过职位',NULL,'智联招聘','','candidate','2026-08-04 15:24:42.107414+08');
INSERT INTO candidates VALUES (13,'male',0,'本科','宁波',12,'工业设计',15,20,'在职-正在找工作','1小时前浏览过职位',NULL,'智联招聘','','new','2026-08-04 15:24:42.113668+08');
INSERT INTO candidates VALUES (14,'male',0,'大专','嘉兴',17,'工业设计',15000,30000,'在职-正在找工作','2天前浏览过职位',NULL,'智联招聘','','candidate','2026-08-04 15:24:42.117972+08');
INSERT INTO candidates VALUES (15,'male',0,'硕士','嘉兴',3,'工业设计',8,15,'离职-正在找工作','24天前浏览过职位',NULL,'智联招聘','','new','2026-08-04 15:24:42.123115+08');
INSERT INTO candidates VALUES (16,'male',0,'硕士','浙江',15,'工业设计',20,30,'离职-正在找工作','6小时前有回复',NULL,'智联招聘','','new','2026-08-04 15:24:42.128491+08');
INSERT INTO candidates VALUES (17,'female',0,'本科','嘉兴',5,'工业设计',9,12,'在职-看看机会','2天前有投递',NULL,'智联招聘','','candidate','2026-08-04 15:24:42.134882+08');
INSERT INTO candidates VALUES (18,'male',0,'本科','嘉兴',8,'机械结构工程师',0,0,'在职-看看机会','10小时前在线',NULL,'智联招聘','','candidate','2026-08-04 15:24:42.139692+08');
INSERT INTO candidates VALUES (19,'male',0,'本科','嘉兴',10,'工业设计',10,15,'在职-正在找工作','2天前浏览过职位',NULL,'智联招聘','','new','2026-08-04 15:24:42.145416+08');
INSERT INTO candidates VALUES (20,'male',0,'大专','嘉兴',13,'机械结构工程师',10,15,'在职-看看机会','3小时前浏览过职位',NULL,'智联招聘','','candidate','2026-08-04 15:24:42.153786+08');
INSERT INTO candidates VALUES (21,'male',0,'大专','嘉兴',20,'工业设计',8,12,'离职-正在找工作','10小时前在线',NULL,'智联招聘','','candidate','2026-08-04 15:24:42.157611+08');
INSERT INTO candidates VALUES (22,'male',0,'大专','嘉兴',22,'工业设计',10,15,'离职-正在找工作','10小时前在线',NULL,'智联招聘','','candidate','2026-08-04 15:24:42.162819+08');
INSERT INTO candidates VALUES (23,'female',0,'本科','嘉兴',13,'工业设计',4,6,'离职-正在找工作','6天前浏览过职位',NULL,'智联招聘','','new','2026-08-04 15:24:42.168152+08');
INSERT INTO candidates VALUES (24,'male',0,'',NULL,0,'',0,0,'','',NULL,'Boss直聘','','new','2026-08-05 09:00:10.078744+08');
INSERT INTO candidates VALUES (25,'male',0,'大专','嘉兴',5,'机械工程师',5,8,'离职-正在找工作','2小时前浏览过职位',NULL,'智联招聘','','new','2026-08-05 09:41:19.55229+08');
INSERT INTO candidates VALUES (26,'male',0,'大专','嘉兴',22,'机械结构工程师',8,11,'离职-正在找工作','1小时前有回复',NULL,'智联招聘','','new','2026-08-05 09:41:25.347981+08');
INSERT INTO candidates VALUES (27,'male',0,'本科','嘉兴',21,'项目经理/主管',15000,30000,'在职-看看机会','5天前在线',NULL,'智联招聘','','new','2026-08-05 09:41:38.281887+08');
INSERT INTO candidates VALUES (28,'male',0,'本科','嘉兴',5,'工业设计',10,15,'在职-看看机会','6天前浏览过职位',NULL,'智联招聘','','new','2026-08-05 09:41:49.880294+08');
INSERT INTO candidates VALUES (29,'male',0,'本科','嘉兴',8,'工业设计',18,22,'在职-看看机会','在职-看看机会',NULL,'智联招聘','','new','2026-08-05 09:42:13.923885+08');
INSERT INTO candidates VALUES (30,'male',0,'本科','嘉兴',6,'工业设计',10,20,'在职-正在找工作','1天前有回复',NULL,'智联招聘','','new','2026-08-05 09:42:25.985957+08');
INSERT INTO candidates VALUES (31,'male',0,'本科','嘉兴',5,'工业设计',12000,20000,'在职-正在找工作','2小时前有回复',NULL,'智联招聘','','new','2026-08-05 09:42:36.140166+08');
INSERT INTO candidates VALUES (32,'male',0,'本科','嘉兴',7,'工业设计',9,15,'在职-正在找工作','5天前在线',NULL,'智联招聘','','new','2026-08-05 09:43:22.351428+08');
INSERT INTO candidates VALUES (33,'male',0,'本科','南京',6,'工业设计',0,0,'离职-随时到岗','刚刚活跃',NULL,'Boss直聘','','new','2026-08-05 09:51:56.732679+08');
INSERT INTO candidates VALUES (34,'male',0,'本科','上海',9,'工业设计',12,13,'离职-随时到岗','刚刚活跃',NULL,'Boss直聘','','new','2026-08-05 10:06:23.480722+08');
INSERT INTO candidates VALUES (35,'male',0,'本科','武汉',1,'工业设计',8,11,'离职-随时到岗','在线',NULL,'Boss直聘','','new','2026-08-05 13:06:26.245579+08');
INSERT INTO candidates VALUES (36,'male',0,'本科','嘉兴',10,'工业设计',0,0,'离职-随时到岗','',NULL,'Boss直聘','','new','2026-08-05 13:28:14.619928+08');
INSERT INTO candidates VALUES (37,'male',0,'大专','嘉兴',5,'工业设计',5,7,'离职-随时到岗','刚刚活跃',NULL,'Boss直聘','','new','2026-08-05 13:29:03.013853+08');
INSERT INTO candidates VALUES (38,'male',0,'大专','嘉兴',1,'工业设计',6,8,'离职-随时到岗','刚刚活跃',NULL,'Boss直聘','','new','2026-08-05 13:29:34.23176+08');
INSERT INTO candidates VALUES (39,'male',0,'大专','浙江',29,'工业设计',18,25,'离职-正在找工作','3小时前浏览过职位',NULL,'智联招聘','','new','2026-08-05 14:20:11.602156+08');
INSERT INTO candidates VALUES (40,'male',0,'大专','嘉兴',14,'机械工程师',15,17,'在职-暂不找工作','3天前浏览过职位',NULL,'智联招聘','','new','2026-08-05 14:20:21.962908+08');
INSERT INTO candidates VALUES (41,'male',0,'本科','浙江',5,'工业设计',12,15,'在职-看看机会','10小时前在线',NULL,'智联招聘','','new','2026-08-05 14:20:31.385381+08');
INSERT INTO candidates VALUES (42,'male',0,'本科','嘉兴',4,'工业设计',7,9,'在职-正在找工作','一周前浏览过职位',NULL,'智联招聘','','new','2026-08-05 14:20:44.337024+08');
INSERT INTO candidates VALUES (43,'male',0,'本科','嘉兴',11,'3D设计师',10,15,'在职-正在找工作','10小时前在线',NULL,'智联招聘','','new','2026-08-05 14:20:56.705583+08');
INSERT INTO candidates VALUES (44,'female',0,'本科','嘉兴',3,'机械结构工程师',8,10,'离职-正在找工作','16天前浏览过职位',NULL,'智联招聘','','new','2026-08-05 14:21:07.848215+08');
INSERT INTO candidates VALUES (45,'male',0,'本科','浙江',5,'工业设计',16,20,'离职-正在找工作','15天前浏览过职位',NULL,'智联招聘','','new','2026-08-05 14:21:16.410349+08');
INSERT INTO candidates VALUES (46,'male',0,'大专','嘉兴',6,'机械结构工程师',10,20,'在职-正在找工作','18天前浏览过职位',NULL,'智联招聘','','new','2026-08-05 14:21:28.387039+08');
INSERT INTO candidates VALUES (47,'male',0,'大专','嘉兴',20,'工业设计',8,9,'在职-看看机会','48小时前在线',NULL,'智联招聘','','new','2026-08-05 14:21:40.534831+08');
INSERT INTO candidates VALUES (48,'male',0,'硕士','上海',8,'工业设计',25,35,'在职-看看机会','10天前在线',NULL,'智联招聘','','new','2026-08-05 14:22:21.728123+08');
INSERT INTO candidates VALUES (49,'female',0,'本科','嘉兴',7,'工业设计',7,8,'在职-正在找工作','24天前浏览过职位',NULL,'智联招聘','','new','2026-08-05 14:22:38.844091+08');
INSERT INTO candidates VALUES (50,'female',0,'本科','嘉兴',7,'3D设计师',7,10,'在职-正在找工作','22小时前浏览过职位',NULL,'智联招聘','','new','2026-08-05 14:23:06.701126+08');
