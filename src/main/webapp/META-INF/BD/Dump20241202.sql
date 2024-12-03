-- MySQL dump 10.13  Distrib 8.0.40, for macos14 (x86_64)
--
-- Host: localhost    Database: matricula
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso` (
  `idcurso` int NOT NULL AUTO_INCREMENT,
  `nomcurso` varchar(40) NOT NULL,
  `fechaInicio` date DEFAULT NULL,
  `alumnosMin` int NOT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `alumnosAct` int DEFAULT NULL,
  PRIMARY KEY (`idcurso`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (11,'Java Web','2022-01-15',10,'0',0),(12,'Java Fundamentals','2024-03-07',20,'2',20),(13,'Angular','2023-10-01',10,'1',0),(14,'Spring','2024-01-01',10,'1',5);
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matricula`
--

DROP TABLE IF EXISTS `matricula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matricula` (
  `idmatricula` int NOT NULL AUTO_INCREMENT,
  `fechaMat` date NOT NULL,
  `usuario` varchar(10) NOT NULL,
  `idcurso` int NOT NULL,
  `estado` int DEFAULT NULL COMMENT '0 - Inscrito\n1 - Pagado',
  PRIMARY KEY (`idmatricula`),
  KEY `FK_Usuario_idx` (`usuario`),
  KEY `FK_curso_idx` (`idcurso`),
  CONSTRAINT `FK_curso` FOREIGN KEY (`idcurso`) REFERENCES `curso` (`idcurso`),
  CONSTRAINT `FK_Usuario` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matricula`
--

LOCK TABLES `matricula` WRITE;
/*!40000 ALTER TABLE `matricula` DISABLE KEYS */;
INSERT INTO `matricula` VALUES (3,'2024-12-02','carmen',13,1),(4,'2024-12-01','luis',14,0);
/*!40000 ALTER TABLE `matricula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `usuario` varchar(10) NOT NULL,
  `clave` varchar(10) NOT NULL,
  `nomCompleto` varchar(50) NOT NULL,
  `foto` mediumblob,
  PRIMARY KEY (`usuario`),
  UNIQUE KEY `usuario_UNIQUE` (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES ('carmen','12345','Carmen Rios',''),('carmen1','12345','Carmen Rios',''),('carmen2','111111','carmen',NULL),('luis','123789','Luis Mallqui',NULL),('maria','444444','maria',_binary 'RIFFÆ\0\0WEBPVP8 ¢\0\0êÇ\0ù*^>m6óH$#\"!$\‘jhÄ\râgnﬁøé8hå\œÀøê¸∞˜àæ/ß\Õ\∆7z˚\‘6£mÅ÷á\„qÕâÕøDGQû˜\·÷û˘\‚º	˛\’\Í\”0òdtä∏[∂ç†lñº`(å`Zîâzh´ç\ÀH7\’34x\ÿ\ÕU\»4m*d2\œ\–}ù\”%à!ò|Ä\ŒK∂\È£\Î)˛\\≥_õ\ÕqÆªE—úé∂k|?\Ào\»\”\Èœßº ó˝4ç\Í\ﬂ[	É\”|≠ÛÖéäÒ^ùL\Á\Ï\Ÿi\‘M,l=Ω>ö*\‡<¿\Ào®á{5ı1z\∆◊¥Ö]nÓ≤∏Ï∏™∑}w.\rÙ∑wÅ5\⁄˘\∆r—¶™\ÀÚà:J5\’l9ı◊¶wu5,t∂.\ÈEÛsû\«˘\ÁnGkör\Á\À¸\”H\„H#ßí[¯;\”K¡ñMr|U72Ù¡ú\ZŒòUlÙÜ\÷¸ä˙\"ì7x yJ†ˆÖ+\È∑wüM\Z#\—\…,p¬øPå∫¶˝\›\≈ZΩ`µﬂ§ç8%\‚DÆ ãs]aµ∂“¶@Üñåb[≥\ƒ\·˚D\€x\ŸZ≠åûZ\0FÇ°\Ô√∞%&ùK~EY\ŒVé\rˆECòß°*≠\ÿP\Ëæ’èsæ<-.+RµM\ÿ\—V\«H´∂à’õU Ω\Â\œÚã\Îf”ÅÙ≠O\‡É\ÿ\“MÒ≤µ˙Ñs[ümÿÄ\È∞˝m\Á\”M\ 2 å´7Å\r(K≤f≤}©ëï(8á\€a∞]>§-∂\«u\Z\ƒE\Ëo>ö*\„dLÇ“°e!œäÜHZL;\‘\ÎP8MuW\ÈÇ\ƒ\ÀXAB5µÚ\’$¡x\◊U±\Í0∫öYı \œ¡\ﬂ\ﬁêb\"∑:;OG`]y\Ã¡ª∂y≠°\ÂCâ˚>\€c,ö*\„^.\œ8p\'˝˝Md¡DO2≈™˝%Vy@˙ôùn6ˆEs\ﬁV}4Iï\Ê}˜Ú\‘;\€3BË´çxò\Íp◊™\«¸?Ïéõß•˝\Ãá	™ΩâLW(¥J1äI\Á\≈XXvœâ£“ô\Ìv6\ÿaï\rû∂\⁄\r\Âx\”ùæÄ({dô7ˇ˛MEN)yé°\ÃRÇz¶-\œJ:\Âa\Ÿ\'póà&^°\Èú\€xˆZΩZ\‰ß,\ŸSK.;Z\Í©˝ı\Ë\◊(ú°\Â\\	ÆV)•T\Èıˇ\n!lO\Ó\Âr\Àq4<xt\ŒSWA\\ñs%¥J\¬”äã\≈X\–ˆ∑ß&ôFL¢\÷Æ¢Øõ\Áÿõ|h\Êê\Ë\‹Û`\∆D(ó\ÿ\ÿm&$LI?\◊±\√|Æ^,(u-§úvÉGõ¥Ç2fRˆ>\Î\⁄`\À\ﬂ\"\‰ô\Z;\\8å^@±éü\rL∏›Ñ≈è\›´Hc<\—£:—Ø,∫_R,˝r∫≤i¿|o3\∆.\Ô9´n)Åâı™\ÓÒ∂TZâ,[\'\Ÿiÿê\Ë†\0\0˛˙\œ`í\Á¡ëXΩ}7ìo6>\≈\'’ü\Ó*s\0C\œ\‹)gäá\Ï<bJ\·Flâ\"µπ^Lì\'	˝±c≤∂å.øQó∫\'R~\√\ÍHT\Â5p∂∂ç\ÿI®\¬\◊k¨Ü3tâíApA§\'∆é˙h[\ÿv∂˜ãKù\∆\"±\√-\“˛(\»\ŸÕå¥\≈eo¡_\„hl2Ω§\0¸>¡X\€€òå?øˆ´Ú?V¸T\‚\‰ø`Sü\„è4¨\∆ÕäY\Ê1∂üo\ﬁ-SOE∫ãF\Z˚\ﬁ\¬\÷Myóè,tYò£cÏã†wAC\Ì\ŒL}\ÏIÆü*^4ó<\Î\„K∞FMöu+#ßdê>˜\…ﬂé\n\⁄\ZΩ\Zh\÷\›{q¶<\‘ÊàÄÇ\ÿ}åãû∂ûk)h®πgï}∫mXq<ù\«bwáG˙⁄π\n\È\“\ ˚Úan>¨{. Û<O4\“$ì°ë\·gÜ®fŒ´ª\Z“ò\Ê¢>ëKÜó®\Í+ô`\‹\\ìCÉO@\∆\Œ\›À´_\Ï9!Ûä@w9EhY˛z\0Ü2\À¸J%íì:ÜÕûm][MEûüo˝•Ü\÷;äv\¬rúó\rv\€]!\09ÄC\◊TﬂâÒáeπ>PπëslDtQNMºä\ÓdÄ\ÔΩ˝µ5–Ñ\∆8/\Ô\—\ÿv£\ -\È\Ì\…\œ:¨\Â9qÉ\⁄;\Ÿ?\ u°\–¡Ñ‰†ó˙ÜπR:a~áA0ˆ´\€g˜æ\ÎÄ¿\√\Êê\«Y:Ã°>%Æp@y\Ê\ﬁ\Ìªº>«ô>ÚfÚ\Â\Î‘πêß\Î\‰BH\◊)∂M?\0cˇª:JI¥ÙV˚¡\"dr\"`™\r\‚à\›\«\√¿¸’•0πWDÆ≠∑\Î\Ô\”ÛÄ\’&\œ\÷\ÀÿäAW|[t%NFö\…Úéjìø_?Ú.\Z∞\ƒ¸\‹V3bc?{\≈zgjo\„h0iX3\‹mRoiïÉô§\r¢≤F%g∑A\Z\≈9@g\ÂÀ©a®˛.\Z\·˚æ\’\Óoô¡_US§\ÍZ∫Ú˜W†¿Y§(∑ãt√õ\⁄YáØ¨±∑À≤5}0$J9\À¡PÉ\∆˜\√imˇ¡Gvœï\Î\√u\‚\ÈapF1–åç$\“Ã°«å\ﬁÃô{â\€\ﬂ‰Ω§≥HÖÙ\ÌET\Zz)RÉqº4J∫èõf\◊Fñôoàl	W4\\|\ﬁ\'ˆ[W\ŸÛü≥\Zøá\ﬂí\‚D/âíÑV\\Gú\rx\Ë/\Íøw˝\Ë\…\–¿\ÂbÚUΩKÜÛ˜C;íä[\ÂVkû«ù\Ëªﬁù‡°ãO\\óêÆCFãg;\Ê˙*&>cä˙Ç(º+\r»æ+P§n\Z\‹Ú\⁄]J¯éây¿êäN?\Zb\Ï#Ü\È\"æ,2H@™˝,Ö\…\rß\·ù÷≥3Dõ≠G<â–ôÒ\ 8\Œ\nªU˙q[≈°m¥µpJ»à◊∂è¥DgÑv\ﬁ\ƒ¨ÇbX≈ò!\ﬂt%\ÿLí\’Ò#‹ùßAµ\ÀuÄ`\¬q4t\„rù\‡y\ÿîÒÖò{ê>8<\„/]r\ÏÒßïY\nú¸DF©õ@9µ\0©˜\—ñÚúa≠Ç\Ï8°\œn¢ÇN9™§,kv\0†Äãw\«hqÚ/{\–K(ÖC∫{≥í\„˝29Æ,,b˝\0‘¨&c˙}<êD\ I@\ŸD±ùôhg∑Äí\„-\√HÛlû\…\¬FQ£](\Õ_óÉU¢Fk⁄â™#Fyª~¸<µæz0.m\ZP#ß+$!väEÒkåL&Ñà¶Üıgp\‹‹æ¨|fªì\ÌUE6_7eóÆªTGYà\ÈB)HVVº\Ê˝\·L\Î%\„m]å˝Ñ\ÃKúØg⁄¨õh$è ˚:§ú≠∂R†í\⁄`ö´ˇñπ~S\‡62Iµj(Øõ\Ã\‹Eü∑\ÿπí¸àü•OÇµ¿™Ñ∆£\√U,˛ç˘ï	Ië6\ÂuÇ/o\ﬁ\Íß/\Ì˘Q¿PÀé\ Kü•:ëfÇÚ\Ãn ÑSÖ¨Wä–®™\È\Ì\·≥B§¥¿\ÁL7äWˇ\≈Ù&@ènerˆ$í&taV\›\œZ\…\Ì£Àñò≤Ac)I;;,ùh^R\—\–Poä[	\ÈQ\◊nF∫1Ü}AûO%ﬂª≥UeLik\∆2ÆOØÕºù?\‚±e \Â*;<\€\À\”\“\—rk%,á§6\Â≈ª•õù7J∑üìy\◊\‰&É@qhãF\Ëî\Î\Ì∑\ÎaJ\‰)\r`T\ŒŸ≥-íK\ﬂV,n\÷q\Êc\÷77éà8˙àúyxù{$É4π\Õ\∆z\Í\‹*\—L\…xúà\ÀVC?Æè>%ìâ;@M\„ägkè7)u	âÚ\«:R\Ãr≥\ÎÖ!\√\—k]µœà>\€;\\\ÔÜ¯6\Ã_x∑œãÇ#ù¯≤ñ=\‰MÇ\ŸiÅ\ÊLû4Q¸ï∏\ÍΩ¯Úá1\œq~åAiM˙¯ûÎ∫Ä?©r\Ìfb#†§›∞©é™<õ$eNò1â\«	\Ìx\≈\‰ï\⁄Iœ¶s\∆∞>¯q\·å4ˆ±\Ãlˇ\‹\ﬂ\ni2Y\Í•ıD1≠®\Á\œvˇ\⁄d!+c\⁄4!J\ÁP¢wÄwv5\Ë*Fy˙în5k£hÄ\Ê%\–a§Êî≥\È±é#ØÖ\\wm~¡|à\Â\ƒ\€\’\ÿ4\Z\„!õ\€M+◊∏é§9,yπ)µ\Ã\…HáI.cA\‘Nv≈≤§ˆ\„\nC∏KO\Í´¨z#!\–`YDn\È‡¢à˜Iu∞\Ëè*òvy<GIqQ5p\0ùq^¢]6ªw\Ó\»˘ó\ﬁWêÕö˚he{>Æ<OPÅã0<\”\Ÿ\‚\'»¶\‚á\‡\‰b$\0n\«QlO{´ps©\0w^txßf¥V\√_†W\rUQ?î.ñ˚\ﬂª≤†Ä3Kh¶ºÛ0W\⁄\ÃõUä>û\0\‡I˚O¯Ü\„B\‚c€Æ\ÁÙ–öπ7hmß\Ô[åú°ç\n`ÛX’ïkó\ÁSú§Dö\‰ÑWè\‚&\ n\Ó.Ô∫ç§gc\Ê\∆8=løÑp-3¥±\—˜7jÛ+C-9•2OPKπ X)\ÀCzΩ¨ö@E{PG\Ã-£d{eÖ≥/%ÄÚ’äZ\Îª˚≥lÂùÖ\"†>º1\»ØŸ§\n6´\√¯{\np\"o-^V/¢h†ú\«eG¯ı\Îü:Ø\Ê\‡ffodØ≥¡\œ|¿z[ÖÅ˙x\Z\ÂE6Ú´\ÿ>mc÷ºGWÅ™FÚí\n¥õ\‘~j¯§7º\¬_\‚t\∆?◊øWÕÄ-ÄÅ”ÜR©\Ëˆ\’!\Ë7d˚Ú\Í\"*uR˘/˙T≥OV$\œ\Âr%9âü~#\‡\Z\‚n[@MCˇø\≈.\ƒ\ﬁ3Ä®\„ñoB\—˘Ç°rZÖ	§à§v≠re©wM#\Ê–ó$e%Ié.àÚ˝öµ&Äú\ŸE6ù6{N∏ñ20˚O(˝\Ï)˝ΩÇ¿D/Æ\Ã\ƒL™ûª¯≠EG\Ì.-_Ùx~\÷6>≠Xduı\'é-v@9vå\ ˚k4&\Â\·ø\–E7jÇ_ı\œ2pﬂ≠“©i\ÊbHÜ\Œ\·#†˘+\…aBzbqÚ\Z\‡\⁄PêT\ÀX¢¸Ç\ﬁ˜73\”˝(¸ºzQ¿vx\Z\ÀE˝rè4ıÜ\–\Zyê6!\'†©¥FãØïLò: Ö˙uˇ\‰g\0m∫c≤ÇrÛÑø`[\n#2∞4∑8rñz˘\÷≠ÅR€ò≠\‘sp∑c&JâwCê\Ã5{≤W[¢\'(˙)íHk´\√ÿ°¥\ÌÄw@Ø\’N\ÏOÅC≤\Ÿ«Ç\À\Óà≤åMøπ°˚G<ﬁä°#Û\ËÒ Øœú\”\÷(\‘ˆûÚ™:@x7°â⁄é\“\ZœÅ8{#÷∑ìñ∞òr;™\n5hΩ˜\Ê-π.$Ü\ﬁXøáñ\Ï\'§¡©\ÿ\‡ár\⁄E\»!r\·∑ ¶ìhm;ùπNëéó≠Ù≠ˇQ\„Z\«Ñ\Î\‹Lú\∆	,\‡\◊33ùã\›m\Ì±q0\Ã!5ßˇ\›+}\\ƒô…ìfBÄ	<N\ÃS\«ˆ< !ü¨ï+\»}c\Î¶ˆ\⁄ç∫©\È\ËÄ*^´\Á‘Å≠\"L\ÌqzBˆıŸì($©dÕóˇï>≥¥B[\‚T!\ﬁpV\‰P»µ[òWŒÅç{9¨ú°¥|1!}GlÆ≤/\‡<´Ω¡ûÉC™rJ∏˛9]SΩ4OnÑíΩm]q¿V≥á¢\‚∏\Ë\‡\0J\Ê¶OO¸L=Ÿ∂ÚõÉ˘\‡º†\Z\»	0Ú\'Ω&\ÿ\‘\‘«Çò≥T†-£\ 8µ≥ˇ6tq¨æõ^∏]hˆ√≥°ú÷¢ºo\«¯°T:»ãP3C±ı1˛Jnîÿ¥xC¯Û\◊#6Û=∑\…ø¬å\'osÇ]\∆\€K\ŸYò B\Ôπ∂Üê¥ˆ¶î\‡b=WG(5ù,sµ*õHé%Xá\Ÿ/d~˙[=¥N\«;0}5CT\0RÜeå\»%è|\’TOıì4µô§H5\Z>ˆ™Âìæï\ﬂ(\Ó˙ˆö≤fï\…}\nüˆU≥JS˜\÷2ˇkP\Á%§ HÜé°à≥Ôº±Ñ\n(\nÇµ‘º$\›JDRùˆüí\Ì m¿≤VñîkˆˇÙ\Á\Óøbé¶åœè¶o)\œv@R≠~æ*/;\“C\œSY≠ç!-ÑOó\Ê\Ÿ¿\‡NÉl\÷6ØF~˝\n\¬ZH•\≈õµØ2Fí\nLØ¨òZÃ™\ŸxÇ=•l>\Ô\Œ\œ\≈˙b\‹\Ê4\›ÙÑ\ \Ÿ\ÎÆ¿X^œîSÆ£©∫\–\»(T\—a£C¸2°I~¡;Ä[\ÁUFGb\Ë§\»ˆgè\Á£cÛ\‹\⁄\Ê\ÁL´ºÛ¨”≥†¯rë\'Ã∂´\›\Ë˛è\Ïö)MîJ¯°˘\⁄?m0\ŒPªØöÈ≤îxNk_gÑäº!z+nÑ£+t¥%\ \È∞\”u\‰o@UÄH´9FAê\Ó	˜\‹x&¡5àÇ‹òGyºî4’¶3á!\’@îÉ∑\rE\Ë•\Õ\ÿ!<\ ¸:Lü†ˆQ8\‡h¯,;,~\ÎZiãˆ-I1_°\Ï\\\√˛I∞>§˛\‘FÑ,\0\‚0\‚p\Ô–ïc_a î~Ãñ\‹l@ıa®Øö\Ì@\‘\Ó∂y\„uÿ¥\Á\›\‚5\ dÙ˛\÷\›~=*g˚/∆û‘ëBF\'dî\‰˚EèõV`\›˚œ®Ä!_\”`\√_oÄª\Èf\≈\ÃYå7Ÿ∑;¡¨òS¸hß\Œ	à’ãzuˆπé,ÉÙ=∏+®\Â±d\„@:\ÁO*äü\"Ω\”~hK≥k#$˚lùvÙ;\\\nfÑ`Â≤ç\‚\Âg∆ûê9Ò¬†‘ìO¥~≈ã\‰K\ËÀ•˛_k\ÓÛ\ÔÜ@Ë©§û&á\—q∞d\Ÿ\‡x*\“&fØ\‚µN$º¥†˜d®\Ï\"ë´¯ã®ê[\'\◊-Z:∫}±|˛hLˆ\‚cÅ&π8\«deh\Œeı◊°NÆí≠xå\”\÷\‘y\¬;\‡N˝\Â\…d˛\‘˘$I÷ñu\'%<\‘\0¿˚Y\◊÷• /˘€¶\‹S\r\Á\ÃA	\Ï˚)°\€ºwq\—-8\—\∆Y\«ı¸\Ì>\œ[IIq_Æ7{∑ıu\…\Ì4¡O\Õ>ú!\—mà\È%è\ÊÇw.I(N44`R\rHΩ¶\Í!0O\ÂB5\·bkqÅ£keÇ¢\⁄⁄πr\‡ûU^<Va+\—´\–\Õ\rìt≥©\„ÙñmŸè\Íñ- ´≥{Å¯ÖFU±(™fq\ﬁp+\ =õ°ä<1∑(Çs\›k\Ë≤ ãâ<¢ìG\rKj®VÙ2cº™)‰Ñ∫\·œúãä–å≥∂)¸y\◊\Õı(ºJK5áÒ¢(∫SbKg\ÿ6\‘k0ë°Lá≈ó¡fÅíÆE–∂∂Sé¶ˇv\Êq\‚Ö^u]≈ß\–Ûºx\ÏµXÙ\·(0hΩΩ\ﬂ4C\œF!A9D∏\ÿ!êq¨^)\"\rÀæ\·±\ŸK•{%\À¶\Í9uëç\‘5J¯;\Ì\Ê=G®§\«}üÅõãÛ\ÎÆÃÖˆú•\Ê	:Ω8!°\¬\‹û≤\0h˘;äF+q_Æ7Å\«€µö,@πU\€c∂˚.*ê2ö©^>\ÍÀêãèo3\Î[\'¿O¨°¨CÅ`GY\Õ5•∫ñBâFÇ>u\…r]Y<At[b\ÁX\ﬂXaôı#~¶-π20[JJ\Î\Ë®8\ÃblêJt\·\ÏE\“\'\ZÅª\Ô.∏™åßa•\r\”*\ÁkÀ™]íakû6^ÛL-Aú\ÓêFN@6{¢®˙∏\ní\‡.\0T9]!”Ä∂M´óáû£\ZA9ùy¿C¿\ƒ\…\Í\…ú≠zQc\È7\Ó´\À)®cÛ}>\‡~\\¸NnÛ\Ì>Sû¡UA\≈\ÎlÑ;\‰†_ã¯Ü\Ô\ÌN{Ò∂D\ g\Ïõ0ı\÷\nKí\‰\√[ã$HGıdC\ƒ\nW\"OÙ\¬I˛\\dóßJ≠ΩL5\»˙\Â^\‰¨ıÎº´å\Í\€ˇ@t ∞Äê\À ò∑æ›ñóˇ@˚¡ÉwMe8=…∫¸NÅ’õ\À+D\0maŸéà\≈_OÛú£<\Ãk_6ô˛®MY\⁄Œ≠\Ãå\€\¬\…\œ{˝,ÖÆLµH0\◊#»ëY3s√†Åí\·âQ_ôH§\ÏN¿ÀµBü™\”A¢0\ËÄT\nU}\Á\Ê\·óV˛ÀèΩ\']ù)\ŒCıìÕë0a_\–\÷\Í0i\€BcÚ∏2áìkÚ˛ö\¬5˙\⁄›Ω3î\Êò]ôkô\Ã(·¨°˜\'Çt,™ ®\‘∫\ÈWmt\Î\r\Z\01¿ÙíÑg=Ç%Ò±íˇ•Û\rÚ#\“ÿ∏\¬·Öñz|b∂⁄©O\'\’\À|0\«\Œq@\ﬂlõ\—bEŸ™∫:|C_\‹_Ñ°¸\ËLy¯\Á%è†\ZòãÄ\0úk[2\≈1Æ#ÉP\ÿb\ÔT\„ó	)N\Í\œ\◊ãlKã=üëüΩ¸ù>] 3˘\—2i{•+\◊¯®¶è\ÀÙW&á\Ÿ\œ7ﬂêçõ\\p\ÕL\0t7ˇ_ àC•/8ÒM\ O_^\‡&\ÿl[h≠\ŸBx]Œú˘\‹bkKü\ g¯{rD#Wxú8\rùªN8HK8k\ﬂZü‘Ø`\À˚[z≤#äÅ£˛7\Í»´X\–\‡˘\ÊK ,/C«Çı¡˜\‹®%§\»\ﬂ=],YW7	?®|\—\\c\Ëá‚àø°]çæ\‚\‰∫Æm=èVÛﬁ£\ŒÏ±ÇYq\ÂK*˜\ÿUô\≈M\r\Ÿ5&O»ÉπJXJÚ{\◊\‡kûtU?hn[%é\Ëº\»\Õ< ÅêmFR:áb`\¬y/™@®Ò¥nh\◊tná¶à%&RQ\"\⁄Gá\€nA\'æüò1,A¢1#\À1Iıº\œeÃ∫\ﬂH>[F\Z\ﬂ9N2\÷ë\∆+ΩN+\—F»∂Äo±Dë\‘\Ï/?\…à\ÎN´¯{Ù¨≠-Æ¨¸\≈qt˝v\·\‰`0ç∂\ÿ\ŸƒÅ{Ñémò@.Ò5U§˝3\Í\“\Êf®\÷¸\€,Zeˆ#)ıæsÇEè˚\«2\”látΩóˆ\Ó\‘\Ë N •y\œWkÒ\—\ÓW›´ﬂÆÑ\Ã\ﬁı4ñg≥´ôqˆÆ¸,ã˝π.\”hÛÖ0\ﬁsÙÕ´!˙EÜ¬Çv¢=2ßØµ€ò\Ã2\0—é\\Øzˇı\Ï˝P˜óΩ\ j\Á\Õ	ıªπ\Ô\÷-Dj4$A\“xÚg\œ\–ÛΩì\€\‹E§tﬁ®éivy∫y∑Œ∑IØù≠\À>ˆã∏BvO¢∫˚\ÔÛ9\—\ÁQπ°Ø˚\⁄\Z\€t™áU=A6Ø˚A;£)\‹\Õ\Ëòg\—\ƒ1πi\∆x\'yÉï<Dó±\ŸV$\Z2éπ&\≈˚πhh7q˚?\'=<Ä\Ëeà\ÁÕç≥èj≠lfÄ\0\0'),('user','12345','Pedro',_binary 'RIFFÆ\0\0WEBPVP8 ¢\0\0êÇ\0ù*^>m6óH$#\"!$\‘jhÄ\râgnﬁøé8hå\œÀøê¸∞˜àæ/ß\Õ\∆7z˚\‘6£mÅ÷á\„qÕâÕøDGQû˜\·÷û˘\‚º	˛\’\Í\”0òdtä∏[∂ç†lñº`(å`Zîâzh´ç\ÀH7\’34x\ÿ\ÕU\»4m*d2\œ\–}ù\”%à!ò|Ä\ŒK∂\È£\Î)˛\\≥_õ\ÕqÆªE—úé∂k|?\Ào\»\”\Èœßº ó˝4ç\Í\ﬂ[	É\”|≠ÛÖéäÒ^ùL\Á\Ï\Ÿi\‘M,l=Ω>ö*\‡<¿\Ào®á{5ı1z\∆◊¥Ö]nÓ≤∏Ï∏™∑}w.\rÙ∑wÅ5\⁄˘\∆r—¶™\ÀÚà:J5\’l9ı◊¶wu5,t∂.\ÈEÛsû\«˘\ÁnGkör\Á\À¸\”H\„H#ßí[¯;\”K¡ñMr|U72Ù¡ú\ZŒòUlÙÜ\÷¸ä˙\"ì7x yJ†ˆÖ+\È∑wüM\Z#\—\…,p¬øPå∫¶˝\›\≈ZΩ`µﬂ§ç8%\‚DÆ ãs]aµ∂“¶@Üñåb[≥\ƒ\·˚D\€x\ŸZ≠åûZ\0FÇ°\Ô√∞%&ùK~EY\ŒVé\rˆECòß°*≠\ÿP\Ëæ’èsæ<-.+RµM\ÿ\—V\«H´∂à’õU Ω\Â\œÚã\Îf”ÅÙ≠O\‡É\ÿ\“MÒ≤µ˙Ñs[ümÿÄ\È∞˝m\Á\”M\ 2 å´7Å\r(K≤f≤}©ëï(8á\€a∞]>§-∂\«u\Z\ƒE\Ëo>ö*\„dLÇ“°e!œäÜHZL;\‘\ÎP8MuW\ÈÇ\ƒ\ÀXAB5µÚ\’$¡x\◊U±\Í0∫öYı \œ¡\ﬂ\ﬁêb\"∑:;OG`]y\Ã¡ª∂y≠°\ÂCâ˚>\€c,ö*\„^.\œ8p\'˝˝Md¡DO2≈™˝%Vy@˙ôùn6ˆEs\ﬁV}4Iï\Ê}˜Ú\‘;\€3BË´çxò\Íp◊™\«¸?Ïéõß•˝\Ãá	™ΩâLW(¥J1äI\Á\≈XXvœâ£“ô\Ìv6\ÿaï\rû∂\⁄\r\Âx\”ùæÄ({dô7ˇ˛MEN)yé°\ÃRÇz¶-\œJ:\Âa\Ÿ\'póà&^°\Èú\€xˆZΩZ\‰ß,\ŸSK.;Z\Í©˝ı\Ë\◊(ú°\Â\\	ÆV)•T\Èıˇ\n!lO\Ó\Âr\Àq4<xt\ŒSWA\\ñs%¥J\¬”äã\≈X\–ˆ∑ß&ôFL¢\÷Æ¢Øõ\Áÿõ|h\Êê\Ë\‹Û`\∆D(ó\ÿ\ÿm&$LI?\◊±\√|Æ^,(u-§úvÉGõ¥Ç2fRˆ>\Î\⁄`\À\ﬂ\"\‰ô\Z;\\8å^@±éü\rL∏›Ñ≈è\›´Hc<\—£:—Ø,∫_R,˝r∫≤i¿|o3\∆.\Ô9´n)Åâı™\ÓÒ∂TZâ,[\'\Ÿiÿê\Ë†\0\0˛˙\œ`í\Á¡ëXΩ}7ìo6>\≈\'’ü\Ó*s\0C\œ\‹)gäá\Ï<bJ\·Flâ\"µπ^Lì\'	˝±c≤∂å.øQó∫\'R~\√\ÍHT\Â5p∂∂ç\ÿI®\¬\◊k¨Ü3tâíApA§\'∆é˙h[\ÿv∂˜ãKù\∆\"±\√-\“˛(\»\ŸÕå¥\≈eo¡_\„hl2Ω§\0¸>¡X\€€òå?øˆ´Ú?V¸T\‚\‰ø`Sü\„è4¨\∆ÕäY\Ê1∂üo\ﬁ-SOE∫ãF\Z˚\ﬁ\¬\÷Myóè,tYò£cÏã†wAC\Ì\ŒL}\ÏIÆü*^4ó<\Î\„K∞FMöu+#ßdê>˜\…ﬂé\n\⁄\ZΩ\Zh\÷\›{q¶<\‘ÊàÄÇ\ÿ}åãû∂ûk)h®πgï}∫mXq<ù\«bwáG˙⁄π\n\È\“\ ˚Úan>¨{. Û<O4\“$ì°ë\·gÜ®fŒ´ª\Z“ò\Ê¢>ëKÜó®\Í+ô`\‹\\ìCÉO@\∆\Œ\›À´_\Ï9!Ûä@w9EhY˛z\0Ü2\À¸J%íì:ÜÕûm][MEûüo˝•Ü\÷;äv\¬rúó\rv\€]!\09ÄC\◊TﬂâÒáeπ>PπëslDtQNMºä\ÓdÄ\ÔΩ˝µ5–Ñ\∆8/\Ô\—\ÿv£\ -\È\Ì\…\œ:¨\Â9qÉ\⁄;\Ÿ?\ u°\–¡Ñ‰†ó˙ÜπR:a~áA0ˆ´\€g˜æ\ÎÄ¿\√\Êê\«Y:Ã°>%Æp@y\Ê\ﬁ\Ìªº>«ô>ÚfÚ\Â\Î‘πêß\Î\‰BH\◊)∂M?\0cˇª:JI¥ÙV˚¡\"dr\"`™\r\‚à\›\«\√¿¸’•0πWDÆ≠∑\Î\Ô\”ÛÄ\’&\œ\÷\ÀÿäAW|[t%NFö\…Úéjìø_?Ú.\Z∞\ƒ¸\‹V3bc?{\≈zgjo\„h0iX3\‹mRoiïÉô§\r¢≤F%g∑A\Z\≈9@g\ÂÀ©a®˛.\Z\·˚æ\’\Óoô¡_US§\ÍZ∫Ú˜W†¿Y§(∑ãt√õ\⁄YáØ¨±∑À≤5}0$J9\À¡PÉ\∆˜\√imˇ¡Gvœï\Î\√u\‚\ÈapF1–åç$\“Ã°«å\ﬁÃô{â\€\ﬂ‰Ω§≥HÖÙ\ÌET\Zz)RÉqº4J∫èõf\◊Fñôoàl	W4\\|\ﬁ\'ˆ[W\ŸÛü≥\Zøá\ﬂí\‚D/âíÑV\\Gú\rx\Ë/\Íøw˝\Ë\…\–¿\ÂbÚUΩKÜÛ˜C;íä[\ÂVkû«ù\Ëªﬁù‡°ãO\\óêÆCFãg;\Ê˙*&>cä˙Ç(º+\r»æ+P§n\Z\‹Ú\⁄]J¯éây¿êäN?\Zb\Ï#Ü\È\"æ,2H@™˝,Ö\…\rß\·ù÷≥3Dõ≠G<â–ôÒ\ 8\Œ\nªU˙q[≈°m¥µpJ»à◊∂è¥DgÑv\ﬁ\ƒ¨ÇbX≈ò!\ﬂt%\ÿLí\’Ò#‹ùßAµ\ÀuÄ`\¬q4t\„rù\‡y\ÿîÒÖò{ê>8<\„/]r\ÏÒßïY\nú¸DF©õ@9µ\0©˜\—ñÚúa≠Ç\Ï8°\œn¢ÇN9™§,kv\0†Äãw\«hqÚ/{\–K(ÖC∫{≥í\„˝29Æ,,b˝\0‘¨&c˙}<êD\ I@\ŸD±ùôhg∑Äí\„-\√HÛlû\…\¬FQ£](\Õ_óÉU¢Fk⁄â™#Fyª~¸<µæz0.m\ZP#ß+$!väEÒkåL&Ñà¶Üıgp\‹‹æ¨|fªì\ÌUE6_7eóÆªTGYà\ÈB)HVVº\Ê˝\·L\Î%\„m]å˝Ñ\ÃKúØg⁄¨õh$è ˚:§ú≠∂R†í\⁄`ö´ˇñπ~S\‡62Iµj(Øõ\Ã\‹Eü∑\ÿπí¸àü•OÇµ¿™Ñ∆£\√U,˛ç˘ï	Ië6\ÂuÇ/o\ﬁ\Íß/\Ì˘Q¿PÀé\ Kü•:ëfÇÚ\Ãn ÑSÖ¨Wä–®™\È\Ì\·≥B§¥¿\ÁL7äWˇ\≈Ù&@ènerˆ$í&taV\›\œZ\…\Ì£Àñò≤Ac)I;;,ùh^R\—\–Poä[	\ÈQ\◊nF∫1Ü}AûO%ﬂª≥UeLik\∆2ÆOØÕºù?\‚±e \Â*;<\€\À\”\“\—rk%,á§6\Â≈ª•õù7J∑üìy\◊\‰&É@qhãF\Ëî\Î\Ì∑\ÎaJ\‰)\r`T\ŒŸ≥-íK\ﬂV,n\÷q\Êc\÷77éà8˙àúyxù{$É4π\Õ\∆z\Í\‹*\—L\…xúà\ÀVC?Æè>%ìâ;@M\„ägkè7)u	âÚ\«:R\Ãr≥\ÎÖ!\√\—k]µœà>\€;\\\ÔÜ¯6\Ã_x∑œãÇ#ù¯≤ñ=\‰MÇ\ŸiÅ\ÊLû4Q¸ï∏\ÍΩ¯Úá1\œq~åAiM˙¯ûÎ∫Ä?©r\Ìfb#†§›∞©é™<õ$eNò1â\«	\Ìx\≈\‰ï\⁄Iœ¶s\∆∞>¯q\·å4ˆ±\Ãlˇ\‹\ﬂ\ni2Y\Í•ıD1≠®\Á\œvˇ\⁄d!+c\⁄4!J\ÁP¢wÄwv5\Ë*Fy˙în5k£hÄ\Ê%\–a§Êî≥\È±é#ØÖ\\wm~¡|à\Â\ƒ\€\’\ÿ4\Z\„!õ\€M+◊∏é§9,yπ)µ\Ã\…HáI.cA\‘Nv≈≤§ˆ\„\nC∏KO\Í´¨z#!\–`YDn\È‡¢à˜Iu∞\Ëè*òvy<GIqQ5p\0ùq^¢]6ªw\Ó\»˘ó\ﬁWêÕö˚he{>Æ<OPÅã0<\”\Ÿ\‚\'»¶\‚á\‡\‰b$\0n\«QlO{´ps©\0w^txßf¥V\√_†W\rUQ?î.ñ˚\ﬂª≤†Ä3Kh¶ºÛ0W\⁄\ÃõUä>û\0\‡I˚O¯Ü\„B\‚c€Æ\ÁÙ–öπ7hmß\Ô[åú°ç\n`ÛX’ïkó\ÁSú§Dö\‰ÑWè\‚&\ n\Ó.Ô∫ç§gc\Ê\∆8=løÑp-3¥±\—˜7jÛ+C-9•2OPKπ X)\ÀCzΩ¨ö@E{PG\Ã-£d{eÖ≥/%ÄÚ’äZ\Îª˚≥lÂùÖ\"†>º1\»ØŸ§\n6´\√¯{\np\"o-^V/¢h†ú\«eG¯ı\Îü:Ø\Ê\‡ffodØ≥¡\œ|¿z[ÖÅ˙x\Z\ÂE6Ú´\ÿ>mc÷ºGWÅ™FÚí\n¥õ\‘~j¯§7º\¬_\‚t\∆?◊øWÕÄ-ÄÅ”ÜR©\Ëˆ\’!\Ë7d˚Ú\Í\"*uR˘/˙T≥OV$\œ\Âr%9âü~#\‡\Z\‚n[@MCˇø\≈.\ƒ\ﬁ3Ä®\„ñoB\—˘Ç°rZÖ	§à§v≠re©wM#\Ê–ó$e%Ié.àÚ˝öµ&Äú\ŸE6ù6{N∏ñ20˚O(˝\Ï)˝ΩÇ¿D/Æ\Ã\ƒL™ûª¯≠EG\Ì.-_Ùx~\÷6>≠Xduı\'é-v@9vå\ ˚k4&\Â\·ø\–E7jÇ_ı\œ2pﬂ≠“©i\ÊbHÜ\Œ\·#†˘+\…aBzbqÚ\Z\‡\⁄PêT\ÀX¢¸Ç\ﬁ˜73\”˝(¸ºzQ¿vx\Z\ÀE˝rè4ıÜ\–\Zyê6!\'†©¥FãØïLò: Ö˙uˇ\‰g\0m∫c≤ÇrÛÑø`[\n#2∞4∑8rñz˘\÷≠ÅR€ò≠\‘sp∑c&JâwCê\Ã5{≤W[¢\'(˙)íHk´\√ÿ°¥\ÌÄw@Ø\’N\ÏOÅC≤\Ÿ«Ç\À\Óà≤åMøπ°˚G<ﬁä°#Û\ËÒ Øœú\”\÷(\‘ˆûÚ™:@x7°â⁄é\“\ZœÅ8{#÷∑ìñ∞òr;™\n5hΩ˜\Ê-π.$Ü\ﬁXøáñ\Ï\'§¡©\ÿ\‡ár\⁄E\»!r\·∑ ¶ìhm;ùπNëéó≠Ù≠ˇQ\„Z\«Ñ\Î\‹Lú\∆	,\‡\◊33ùã\›m\Ì±q0\Ã!5ßˇ\›+}\\ƒô…ìfBÄ	<N\ÃS\«ˆ< !ü¨ï+\»}c\Î¶ˆ\⁄ç∫©\È\ËÄ*^´\Á‘Å≠\"L\ÌqzBˆıŸì($©dÕóˇï>≥¥B[\‚T!\ﬁpV\‰P»µ[òWŒÅç{9¨ú°¥|1!}GlÆ≤/\‡<´Ω¡ûÉC™rJ∏˛9]SΩ4OnÑíΩm]q¿V≥á¢\‚∏\Ë\‡\0J\Ê¶OO¸L=Ÿ∂ÚõÉ˘\‡º†\Z\»	0Ú\'Ω&\ÿ\‘\‘«Çò≥T†-£\ 8µ≥ˇ6tq¨æõ^∏]hˆ√≥°ú÷¢ºo\«¯°T:»ãP3C±ı1˛Jnîÿ¥xC¯Û\◊#6Û=∑\…ø¬å\'osÇ]\∆\€K\ŸYò B\Ôπ∂Üê¥ˆ¶î\‡b=WG(5ù,sµ*õHé%Xá\Ÿ/d~˙[=¥N\«;0}5CT\0RÜeå\»%è|\’TOıì4µô§H5\Z>ˆ™Âìæï\ﬂ(\Ó˙ˆö≤fï\…}\nüˆU≥JS˜\÷2ˇkP\Á%§ HÜé°à≥Ôº±Ñ\n(\nÇµ‘º$\›JDRùˆüí\Ì m¿≤VñîkˆˇÙ\Á\Óøbé¶åœè¶o)\œv@R≠~æ*/;\“C\œSY≠ç!-ÑOó\Ê\Ÿ¿\‡NÉl\÷6ØF~˝\n\¬ZH•\≈õµØ2Fí\nLØ¨òZÃ™\ŸxÇ=•l>\Ô\Œ\œ\≈˙b\‹\Ê4\›ÙÑ\ \Ÿ\ÎÆ¿X^œîSÆ£©∫\–\»(T\—a£C¸2°I~¡;Ä[\ÁUFGb\Ë§\»ˆgè\Á£cÛ\‹\⁄\Ê\ÁL´ºÛ¨”≥†¯rë\'Ã∂´\›\Ë˛è\Ïö)MîJ¯°˘\⁄?m0\ŒPªØöÈ≤îxNk_gÑäº!z+nÑ£+t¥%\ \È∞\”u\‰o@UÄH´9FAê\Ó	˜\‹x&¡5àÇ‹òGyºî4’¶3á!\’@îÉ∑\rE\Ë•\Õ\ÿ!<\ ¸:Lü†ˆQ8\‡h¯,;,~\ÎZiãˆ-I1_°\Ï\\\√˛I∞>§˛\‘FÑ,\0\‚0\‚p\Ô–ïc_a î~Ãñ\‹l@ıa®Øö\Ì@\‘\Ó∂y\„uÿ¥\Á\›\‚5\ dÙ˛\÷\›~=*g˚/∆û‘ëBF\'dî\‰˚EèõV`\›˚œ®Ä!_\”`\√_oÄª\Èf\≈\ÃYå7Ÿ∑;¡¨òS¸hß\Œ	à’ãzuˆπé,ÉÙ=∏+®\Â±d\„@:\ÁO*äü\"Ω\”~hK≥k#$˚lùvÙ;\\\nfÑ`Â≤ç\‚\Âg∆ûê9Ò¬†‘ìO¥~≈ã\‰K\ËÀ•˛_k\ÓÛ\ÔÜ@Ë©§û&á\—q∞d\Ÿ\‡x*\“&fØ\‚µN$º¥†˜d®\Ï\"ë´¯ã®ê[\'\◊-Z:∫}±|˛hLˆ\‚cÅ&π8\«deh\Œeı◊°NÆí≠xå\”\÷\‘y\¬;\‡N˝\Â\…d˛\‘˘$I÷ñu\'%<\‘\0¿˚Y\◊÷• /˘€¶\‹S\r\Á\ÃA	\Ï˚)°\€ºwq\—-8\—\∆Y\«ı¸\Ì>\œ[IIq_Æ7{∑ıu\…\Ì4¡O\Õ>ú!\—mà\È%è\ÊÇw.I(N44`R\rHΩ¶\Í!0O\ÂB5\·bkqÅ£keÇ¢\⁄⁄πr\‡ûU^<Va+\—´\–\Õ\rìt≥©\„ÙñmŸè\Íñ- ´≥{Å¯ÖFU±(™fq\ﬁp+\ =õ°ä<1∑(Çs\›k\Ë≤ ãâ<¢ìG\rKj®VÙ2cº™)‰Ñ∫\·œúãä–å≥∂)¸y\◊\Õı(ºJK5áÒ¢(∫SbKg\ÿ6\‘k0ë°Lá≈ó¡fÅíÆE–∂∂Sé¶ˇv\Êq\‚Ö^u]≈ß\–Ûºx\ÏµXÙ\·(0hΩΩ\ﬂ4C\œF!A9D∏\ÿ!êq¨^)\"\rÀæ\·±\ŸK•{%\À¶\Í9uëç\‘5J¯;\Ì\Ê=G®§\«}üÅõãÛ\ÎÆÃÖˆú•\Ê	:Ω8!°\¬\‹û≤\0h˘;äF+q_Æ7Å\«€µö,@πU\€c∂˚.*ê2ö©^>\ÍÀêãèo3\Î[\'¿O¨°¨CÅ`GY\Õ5•∫ñBâFÇ>u\…r]Y<At[b\ÁX\ﬂXaôı#~¶-π20[JJ\Î\Ë®8\ÃblêJt\·\ÏE\“\'\ZÅª\Ô.∏™åßa•\r\”*\ÁkÀ™]íakû6^ÛL-Aú\ÓêFN@6{¢®˙∏\ní\‡.\0T9]!”Ä∂M´óáû£\ZA9ùy¿C¿\ƒ\…\Í\…ú≠zQc\È7\Ó´\À)®cÛ}>\‡~\\¸NnÛ\Ì>Sû¡UA\≈\ÎlÑ;\‰†_ã¯Ü\Ô\ÌN{Ò∂D\ g\Ïõ0ı\÷\nKí\‰\√[ã$HGıdC\ƒ\nW\"OÙ\¬I˛\\dóßJ≠ΩL5\»˙\Â^\‰¨ıÎº´å\Í\€ˇ@t ∞Äê\À ò∑æ›ñóˇ@˚¡ÉwMe8=…∫¸NÅ’õ\À+D\0maŸéà\≈_OÛú£<\Ãk_6ô˛®MY\⁄Œ≠\Ãå\€\¬\…\œ{˝,ÖÆLµH0\◊#»ëY3s√†Åí\·âQ_ôH§\ÏN¿ÀµBü™\”A¢0\ËÄT\nU}\Á\Ê\·óV˛ÀèΩ\']ù)\ŒCıìÕë0a_\–\÷\Í0i\€BcÚ∏2áìkÚ˛ö\¬5˙\⁄›Ω3î\Êò]ôkô\Ã(·¨°˜\'Çt,™ ®\‘∫\ÈWmt\Î\r\Z\01¿ÙíÑg=Ç%Ò±íˇ•Û\rÚ#\“ÿ∏\¬·Öñz|b∂⁄©O\'\’\À|0\«\Œq@\ﬂlõ\—bEŸ™∫:|C_\‹_Ñ°¸\ËLy¯\Á%è†\ZòãÄ\0úk[2\≈1Æ#ÉP\ÿb\ÔT\„ó	)N\Í\œ\◊ãlKã=üëüΩ¸ù>] 3˘\—2i{•+\◊¯®¶è\ÀÙW&á\Ÿ\œ7ﬂêçõ\\p\ÕL\0t7ˇ_ àC•/8ÒM\ O_^\‡&\ÿl[h≠\ŸBx]Œú˘\‹bkKü\ g¯{rD#Wxú8\rùªN8HK8k\ﬂZü‘Ø`\À˚[z≤#äÅ£˛7\Í»´X\–\‡˘\ÊK ,/C«Çı¡˜\‹®%§\»\ﬂ=],YW7	?®|\—\\c\Ëá‚àø°]çæ\‚\‰∫Æm=èVÛﬁ£\ŒÏ±ÇYq\ÂK*˜\ÿUô\≈M\r\Ÿ5&O»ÉπJXJÚ{\◊\‡kûtU?hn[%é\Ëº\»\Õ< ÅêmFR:áb`\¬y/™@®Ò¥nh\◊tná¶à%&RQ\"\⁄Gá\€nA\'æüò1,A¢1#\À1Iıº\œeÃ∫\ﬂH>[F\Z\ﬂ9N2\÷ë\∆+ΩN+\—F»∂Äo±Dë\‘\Ï/?\…à\ÎN´¯{Ù¨≠-Æ¨¸\≈qt˝v\·\‰`0ç∂\ÿ\ŸƒÅ{Ñémò@.Ò5U§˝3\Í\“\Êf®\÷¸\€,Zeˆ#)ıæsÇEè˚\«2\”látΩóˆ\Ó\‘\Ë N •y\œWkÒ\—\ÓW›´ﬂÆÑ\Ã\ﬁı4ñg≥´ôqˆÆ¸,ã˝π.\”hÛÖ0\ﬁsÙÕ´!˙EÜ¬Çv¢=2ßØµ€ò\Ã2\0—é\\Øzˇı\Ï˝P˜óΩ\ j\Á\Õ	ıªπ\Ô\÷-Dj4$A\“xÚg\œ\–ÛΩì\€\‹E§tﬁ®éivy∫y∑Œ∑IØù≠\À>ˆã∏BvO¢∫˚\ÔÛ9\—\ÁQπ°Ø˚\⁄\Z\€t™áU=A6Ø˚A;£)\‹\Õ\Ëòg\—\ƒ1πi\∆x\'yÉï<Dó±\ŸV$\Z2éπ&\≈˚πhh7q˚?\'=<Ä\Ëeà\ÁÕç≥èj≠lfÄ\0\0');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'matricula'
--
/*!50003 DROP PROCEDURE IF EXISTS `Curso_Por_Nombre` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Curso_Por_Nombre`(IN _nombre VARCHAR(50))
BEGIN
	SELECT * FROM curso WHERE nomcurso like CONCAT('%',_nombre,'%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-02 19:55:59
