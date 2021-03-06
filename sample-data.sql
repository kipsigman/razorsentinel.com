-- MySQL dump 10.13  Distrib 5.7.10, for osx10.10 (x86_64)
--
-- Host: aa1s6mtv7yy7wk.ctcziifeyosn.us-east-1.rds.amazonaws.com    Database: razor_sentinel
-- ------------------------------------------------------
-- Server version	5.6.23-log

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
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `article_template_id` int(10) unsigned NOT NULL,
  `status` varchar(255) NOT NULL,
  `tag_replacements` text,
  `author` varchar(255) DEFAULT NULL,
  `publish_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_article_user_id` (`user_id`),
  KEY `fk_article_article_template_id` (`article_template_id`),
  CONSTRAINT `fk_article_article_template_id` FOREIGN KEY (`article_template_id`) REFERENCES `article_template` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_article_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (10,1,20,'public','{\"{first}\":\"Kip\",\"{last}\":\"Sigman\",\"{company}\":\"his family\"}','Kip Keylon',NULL),(26,1,10,'public','{\"{city}\":\"Sherman Oaks, CA\",\"{company}\":\"Clear Channel Media\",\"{hrguy}\":\"Bill Thompson\"}','Roger Barrett',NULL),(27,1,7,'public','{\"{first}\":\"Jane\",\"{last}\":\"Doe\",\"{company}\":\"Google\",\"{president}\":\"Larry Page\"}','Roger Barrett',NULL),(28,1,13,'public','{\"{team}\":\"Colorado Avalanche\",\"{lastname}\":\"Sigman\",\"{city}\":\"Denver, CO\",\"{firstname}\":\"Matt\"}','A.W. Dulli',NULL),(29,1,15,'public','{\"{city}\":\"Palo Alto, CA\",\"{firstname}\":\"Blaine\",\"{lastname}\":\"Edwards\",\"{screenname}\":\"iblaine22\"}','Kip Keylon',NULL),(30,1,11,'public','{\"{first}\":\"Joe\",\"{last}\":\"Zulis\",\"{city}\":\"Santa Barbara, CA\",\"{bar}\":\"The Wildcat Lounge\"}','Ian Curtis',NULL),(31,1,1,'public','{\"{firstname}\":\"Chris\",\"{lastname}\":\"Schwartzy\",\"{city}\":\"Los Angeles, CA\",\"{company}\":\"American Film Institute\"}','Roger Barrett',NULL),(32,1,20,'deleted','{\"{first}\":\"Adam\",\"{last}\":\"Lane\"}','Kip Keylon','2016-03-02 00:00:00');
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_template`
--

DROP TABLE IF EXISTS `article_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_template` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `status` varchar(255) NOT NULL,
  `categories` varchar(255) NOT NULL,
  `headline` varchar(255) NOT NULL,
  `body` mediumtext NOT NULL,
  `author` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_article_template_user_id` (`user_id`),
  CONSTRAINT `fk_article_template_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_template`
--

LOCK TABLES `article_template` WRITE;
/*!40000 ALTER TABLE `article_template` DISABLE KEYS */;
INSERT INTO `article_template` VALUES (1,1,'public','business,local','Local Company Declares {firstname} {lastname} \"Most Worthless Employee\"','<p>{city}--Every year, {company} scours its ranks to find the single employee who, above all others, has earned the title \"Most Worthless Employee.\" Competition is fierce, and prospective winners must have really distinguished themselves as dead weight throughout the previous year to have any chance of taking home the title.</p><p>\"It\'s not as simple as just not doing your work,\" said one of the company officials in charge of handing out the award, who spoke only on conditions of anonymity.  \"In the early-nineties that might have done it, but today to have any chance of being voted MWE, you must not only avoid doing your own work, but also impede the progress of those around you as well. {firstname} fits the bill perfectly.\"</p><p>\"{firstname} is well-known company-wide for being consistently late, dallying on the internet, and being generally uncooperative.  Internal records show that {firstname}\'s last full day of work was well over three months ago, with only brief spurts of activity before that.\"</p><p>Said a co-worker, \"The committee had things easy this year with {lastname} on the ballot. {firstname} is about as useful as a knife in a gunfight.\"</p><p>As \"Most Worthless Employee\", {firstname} {lastname} will have the opportunity to continue working indefinitely and may be offered a promotion.</p>','Roger Barrett'),(2,1,'public','business','{company} to cease operations: poor management and pathetic business model to blame','<p>{city} - {company} (<a href=\"#\"}{url}</a>), an aspiring Internet company, announced this week that it would be ceasing operations. The fledgling startup has reported zero earnings since inception.</p><p>{company} was founded by {firstname} {lastname} (CEO) in his mother\'s garage last year.  \"My goal was to create the hottest site on the \'net,\" said {lastname}, \"I purchased a copy of MS Front Page and went to work.\" After launching the first {company} web site through the Geocities hosting service and registering 50 unique visitors per day, {lastname} was able to procure investment capital from numerous sources.  The cash was immediately invested in flashy business cards, logo T-shirts, coffee mugs, and entertainment.  </p><p>Only six months later, {company} touted listings on popular search engines such as Yahoo.com (Nasdaq: YHOO) and Goto.com (Nasdaq: GOTO). \"This type of positioning in the marketplace will ensure a 4th quarter IPO,\" {lastname} stated in an interview with a local news source.  </p><p>Success was short lived and failure was imminent. Facing lack of revenue and depleted cash reserves, investors became skeptical and demanded an explanation from the ailing startup. {lastname} and his staff of zero were unable to provide answers but instead suggested a second round of financing might be in order. Investors unanimously disagreed with the CEO and decided to pull the plug.</p><p>Following the announcement to close it\'s doors, {company} investors immediately converged on the {lastname} residence to seize all remaining assets for liquidation.  Only an estimated $345.23 of hardware, designer pens, and leftover Thai food were recovered. </p><p>The {company} web site is still up and running but is no longer maintained as {firstname} {lastname} has gone missing following investor threats on his personal assets.</p>','Roger Barrett'),(3,1,'public','health,local','{city} woman eats more dessert than prudent','<p>{city} - Although she knew far better, {firstname} {lastname} treated herself to excess helpings of the sweet stuff during the past month.</p><p>Loved ones agree, {firstname} can\'t afford to put on any more weight. Despite warnings, the cookies and ice cream just keep on going down with no end in sight.</p><p>\"{firstname}\'s really been overdoing it,\" said a close friend. \"And she hasn\'t even made it to aerobics in weeks.\"</p><p>When approached for comment, {lastname} mumbled something under her breath about how she \"did go walking a few days ago,\" and \"that\'s what my other pair of jeans are for.\"</p><p>An investigation continues.</p>','Dusty Eastgate'),(4,1,'public','local','Former love interest claims {lastname} \"doesn\'t quite measure up\"','<p>Los Angeles - Despite recent controversy and repeated public claims to the contrary, new evidence supports allegations that {firstname} {lastname} does in fact possess a small penis.</p><p>The turning point in the \"Short Fuse {lastname}\" drama took place this week as a new eye witness came forward with testimony that leaves little doubt that {firstname} is on his way to purchasing a large pickup truck and taking a pit bull as a pet. The witness, who asked only to be referred to as \"{girlname}\", gave a two-hour interview with visual aids such as a ruler with a lipstick mark at the 3\" line and a size small athletic supporter.</p><p>\"Many women say that size doesn\'t matter,\" stated {girlname} in the recent interview, \"but let me tell you something girlfriend, you\'ve obviously never strapped on {firstname}.\" {girlname} was further quoted as referring to {lastname}\'s member as \"laughable\" and \"comparable to one of those baby carrots healthy people eat.\" On a positive note, she did state that the organ was \"kinda cute though, like the Taco Bell dog.\"</p><p>{lastname} could not be reached for comment but during a small press conference this morning a spokesperson  denied these allegations, referring to them as \"malicious and detrimental to Mr. {lastname}\'s future sexual endeavors.\"  Unconfirmed rumor placed the spokesperson having a laugh with a Dateline correspondent immediately following the conference.</p>','Ian Curtis'),(5,1,'public','local','{city} Resident Wins Lottery Jackpot','<p>{city}, {state} - {firstname} {lastname} recently won the jackpot in the Lottery\'s Fantasy 6 game when {he/she} matched the winning numbers drawn last Wednesday. The jackpot was worth $3,234,934.</p><p>{lastname} will receive a check from the {state} Lottery during a formal presentation at the 7-11 where {he/she} purchased the ticket. </p><p>The Lottery\'s Director of Public Relations Sally Hollingsworth and District Lottery Representative Jan Brenfield will present {firstname} a check for the winnings, less 28 percent federal withholding. </p><p>The Fantasy 6 win was a quick-pick selection. \"7-11 checked my ticket and when I realized I won.. I just laughed my head off!\" {he/she} remembers. \"They let me sit down in their office because I couldn\'t stop laughing.\" </p><p>With {his/her} new fortune, {firstname} plans to buy expensive toys in order to show off to all of {his/her} less wealthy friends.</p><p>To play Fantasy 6, players select six numbers from 1 to 39. Players must match all six winning numbers drawn to win the top jackpot prize. Fantasy 6 jackpots start at $1,000,000 and continue to roll until someone wins. The {state} Lottery also pays players for matching five-, four- and three-of-six winning Fantasy 6 numbers. </p><p>Players must be 18 years of age or older. </p>','Ian Curtis'),(6,1,'public','local','{lastname} Exhibits Excessive Promiscuity','<p>{city} - Although most human beings feel a strong desire to sexually interact with many partners, most suppress these urges for health or moral reasons.  Such is not the case for {firstname} {lastname}.  {lastname}\'s recent sexual behavior has earned her the honorary title of \"turbo-slut\" among friends and family.</p><p>Although {lastname} denies allegations that she gets around like a boomerang, empirical evidence seems to suggest a different story. At least one of 5 men interviewed at a local bar admitted to either sleeping with {firstname} or knowing someone who has. Four out of 5 women interviewed admitted they would never leave their boyfriend alone in a room with {lastname}.</p><p>\"{firstname} once told me that she had only been with 5 guys,\" a former roommate said in a recent interview, \"but at the time I could have counted 5 that month. I ended up moving out because I was sick of listening to her squealing all night.\"  </p><p>With no immediate evidence that {firstname} {lastname} will curb her behavior anytime soon, it appears that many {city} men have a night of fun in store for them.</p>','Ian Curtis'),(7,1,'public','business','Brown nosing has proven profitable','<p>{first} {last} has recently proven that it pays to brown nose at {company}. {last} was promoted after months of brown nosing to company president, {president}. Hard work and skill was unnecesary in {first}\'s advancement. \"I found that our executives here at {company} really don\'t know or care what anyone really does.\" stated {last}, \"It\'s all about being near the decision makers, gratifying their egos, and appearing to be busy and useful.\"</p><p>{last} started her employment at {company} fairly recently, and yet, has advanced through the ranks quicker than most of the long-time employees.  While others have been quietly working hard on their assigned tasks, {last} has succeeded in dodging most, if not all, assignment of duties.  <p>This enabled {first} to impress executives like {president} with a happy deameaner, continually being agreeable, and ego stroking.  This kind of activity provides great value to executives, and is highly rewarded, as shown in {last}\'s recent promotion.<p>In the new role, {first} will have even less responsibilty, and has been freed up to travel and mingle with other high powered executives of associated companies.  This will lead to new opportunities of advancement and departure from {company}.  We wish {first} well on the new position. ','Roger Barrett'),(8,1,'public','local','{first} {last} voted worst breath at {company}','In a recent evaluation of all employees, {first} {last} was voted \"Worst Breath at {company}\".  The vote was based on interviews with co-workers of {first} who were forced to tolerate the smell.  Many employees have exhibited impressively foul breath, but none had the robust, well rounded stink of {last}.  \"It\'s something between the smell of an elephant cage, coffee, and ass,\" stated one co-worker on the quality of {first}\'s breath.  <p>The pungency was not the only criteria in choosing the winner.  The amount of infestation of common areas in the office was also considered.  Some breath is strong for a short time during close conversations, but the real test is how long the stench lingers and attaches itself to the walls and other absorbtive surfaces of the office.  {first}\'s breath could be detected up to 40 minutes after departure.  This is what really separated {last} from the other employees at {company}.<p>{last} was awarded a new pack of Oral B toothbrushes and 3 tubes of Crest, antibacterial toothpaste, along with a coupon for a free dental cleaning.  Congratulations {first}!','Dusty Eastgate'),(9,1,'public','local','Someone has stepped on a frog','Someone near you has allegedely \"stepped on a frog.\"  The frog is of a very special breed which emits a foul order when stepped on.  The fumes resemble common human flatuations, but should not be confused with such.  These fumes are from a Assblow frog, a rare breed from the {city} rainforest.  The fumes are not harmful or toxic, but invoke symptoms in humans in inhale the fumes.  Symtoms include gagging, sniffing, and in extreme cases, reflexive vomitting.','Dusty Eastgate'),(10,1,'public','business,top-stories','Forced-Fun event to be held this weekend','{city} - {company} will be hosting its annual Forced-Fun event this weekend for its loyal employees.  The event will involve childish activities, adapted for adults, and corporate team building.  Employees are required to attend and are forced to have fun, or face posible reprimand from the company.<p>{hrguy}, director of human resources, has worked hard to put together the 2 day Forced-Fun event, and is very excited for this weekend. Events planned include a company-wide egg toss, potato sack race, and pot-luck competition. Each employee is required to bring, at his or her own expense, a food item to be judged. <p>Other team building activities will include a scavenger hunt around {city}.  Teams will be made up of 8 to 15 people.  The winning team will receive a gift certificate for $50 to a local tavern where the group can buy and share a few drinks together.<p>The event will continue through Saturday and Sunday, and employees will not be compensated for attending.  Happy faces are required and new motivation for the company is expected on the Monday following the event.','Roger Barrett'),(11,1,'public','local','{first} {last} found in dumpster this morning','{city} - Local resident, {first} {last} was found by police this morning, sleeping in a dumpster behind {bar}, a popular local gathering place.  He apparently found his way into the trash last night following a heavy evening on the town.<p>At 6:24 A.M. this morning, police were hailed by a local transient, Herb Johnson, to come and investigate the dumpster. He discovered the hapless partier during his regular trash gathering rounds behind {bar}. {last} was lifted out by police and brought to county jail and placed in holding until someone could be located to pick {first} up.<p>{last} was found in tattered clothes, and covered in vomit.  \"This must have been one hell of a night,\" commented Sergeant Smith on {last}\'s discovery.  On interview with {last}, reporters found that he had begun his evening early the night before during a harmless happy-hour outing with friends.  \"I never do this,\" stated {last}.  He had apparently wandered off from the group at about 10:25 P.M. following a fourth round of Whiskey shots taken by the group, and was not seen again until this morning.<p>{first} was held by police and booked on a minor offense of public drunkenness.  He was picked up later this morning and is currently recovering at home.','Ian Curtis'),(12,1,'public','national','Cutest baby debate rages on','{city} - Two local women are arguing over who has the cutest baby.  The argument has escalated to dangerous levels, leaving husbands in the firing range of their disgruntled wives. <p>{woman1} claims that her baby, {baby1}, is by far the cutest baby in town, and all should acknowlege this fact with constant praise.  She has committed herself to mentioning her baby\'s \"cuteness\" at least 235 times per day and never fails to mention {baby1} in each and every sentence uttered.<p>{woman2} has also recently brought a beautiful new baby, {baby2}, into the world, and is convinced that her baby is by far the cutest and most important baby in the world.  {woman2} makes a strong effort to parade {baby2} around town and her work place because she is sure that everyone has nothing better to do than admire her baby.  \"Everyone loves {baby2},\" states {woman2}, \"and they love {baby2}\'s chubby cheeks and the way my sweetie gurgles and smiles.\"  <p>The two mothers cannot come to any agreement on which baby is more cute, and incessantly argue over the subject. Both husbands have been pulled into the issue, but have remained silent as they both realize there is no right thing to say. It appears that until a resolution can be found to the dispute, both mothers will continue to annoy friends and co-workers with their babies.<p>','Kip Keylon'),(13,1,'public','sports,top-stories','{team} sign {lastname}','<p>{city} - {firstname} {lastname} got his moment in the sun today, being signed to a two year contract with the {team}. The deal is worth a reported $-48k.</p><p>The {team} spokesman shed some light on the surprising acquisition.</p><p>\"Although {lastname} possesses no professional experience, he has demonstrated impressive determination and enthusiasm which is the chief reason for his selection. He also has a keen sense of strategy and skills as he can often be found screaming at the television whenever our boys make an error. He has even been referred to by friends as \'The Machine\' due to his excessive beer drinking ability while attending games as a spectator. We hope to harness {lastname}\'s unique strengths to improve the overall quality of the team.\"</p><p>Prognosticators are not expecting {lastname} to break any records this season.  In fact, none expect him even to score. Many analysts, though, strongly suspect that {lastname} is simply a pawn in a greater strategy.  Given that {lastname} is in fact paying the {team} to play, it allows the franchise to quietly purchase a new Lexus for a hot college prospect.</p><p>{lastname} is all smiles regardless of why he was signed.  The chances of putting points on the board are quite slim, but he earnestly hopes that his new-found fame will give him greater prospects of scoring off of the court.</p>','A.W. Dulli'),(14,1,'public','local','{firstname} {lastname} accused of being a \"Friend Who Lets Friends Drive Drunk\"','<p>{city} - A local resident was slandered today by DDAFWLFDD (Drunk Drivers Against Friends Who Let Friends Drive Drunk).</p><p>Said Angie Plasty, DDAFWLFDD spokeswoman, \"Drunk driving is one thing. We all have a bit too much at times and it\'s completely natural to get behind the wheel of our motor vehicles and swerve our way home to vomit on the couch.  That\'s what where we come to rely on our friends.  When we slide into the driver\'s seat and turn that key, it\'s our friends who should be rushing over and stopping us from going.  And if you can\'t rely on your friends, who can you rely on?  Well, you can\'t rely on {firstname} {lastname}, that\'s for sure.  {firstname} is a \'Friend Who Lets Friends Drive Drunk\'. As far as I\'m concerned, there\'s a prison cell waiting and I\'ll personally throw away the key.\"</p><p>Although the reports are largely unconfirmed, that has not stopped DDAFWLFDD from singling out {lastname} for their latest attack.</p><p>When approached for comment late last Friday night, {lastname} could only mumble and hoot in a drunken stupor.</p>','Ian Curtis'),(15,1,'public','national','Missing computer addict found','<p>{city} - Authorities have finally called a recent manhunt closed after locating {firstname} {lastname}, a local resident and alleged techno-weenie.  {lastname} was found at his apartment with the door locked and the lights off.  </p><p>The hunt started over 3 weeks ago after friends and family, who had not heard from {firstname} in months, contacted the Police department.  \"We became worried when we were unable to reach {firstname} by phone\" said {lastname}\'s mother in a recent interview, \"so I called the phone company. They informed me that his bill had not been paid in months!\"  The only reported contact with {lastname} was through the AOL Instant Messenger Service (a popular online chat system) where he was communicating under the alias of  \"{screenname}\".  His correspondence spoke of covert plans to take over the city of {city}, {lastname}\'s most recent residence.  Chat members had reported concern over his statements to AOL chat mediators.</p><p>After police had almost given up hope, residents of a local apartment building reported \"a foul smell\" emanating from unit B-10.  \"We were afraid that someone had died inside, so we made the call to 911.\"  Authorities arrived shortly to investigate.  Repeated knocks on the door produced no answer, so forced entry was ordered.  {lastname} was found inside the filthy apartment sitting at his computer and dressed only in white briefs.  \"The smell was overwhelming\" said Sgt. Fitzgibbons, who had to step out for air to avoid vomiting.  </p><p>{lastname} was apprehended and brought to police headquarters where he was forced to shower and asked to \"get a life.\"  No charges were pressed and {lastname} was released after agreeing to have face to face interaction with other humans at least once a week.</p>','Kip Keylon'),(16,1,'public','local','{lastname} wins the \"Golden Shovel\"','<p>{city} - {firstname} {lastname}, a local woman and first-rate gold digger, buried her competition and took home the \"Golden Shovel\" award this past Sunday.</p><p>Each year the \"Golden Shovel\" is given to the woman who best demonstrates the ability to successfully cash in on dating wealthy men. Many criteria are used to judge the competition, such as dollar sum of free meals in the last year, number of gifts received, and overall manipulation skills.  In addition to these quantifiable values, the winner must show a true dedication to ranking wealth as her top dating priority.</p><p>Said a judge, \"{firstname} was the obvious choice in my mind. She sacrificed a lot to win this award. While many of her friends dated younger men with average salaries, she chased after the less attractive older ones with greater financial means. She has really been able to live a glamorous life without earning her luxuries through hard work like many less fortunate women.\"</p><p>Past winners include champion gold diggers such as Anna-Nicole Smith and Ivana Trump. Hopefully the future holds equal success for {lastname}.</p>','Ian Curtis'),(17,1,'public','local','Guests fear upcoming \"{partyname}\" may be a sausage party','<p>{city} - Despite strong hopes for the contrary, prospective guests of an upcoming {city} social event fear that the ratio of female-to-male attendees will be much lower than desired. Such a \"sausage party\" is the very outcome that all partygoers, male and female alike, hope to avoid.</p><p>If the \"{partyname}\" does end up being a sausage party, it won\'t be the first such fiasco organized by local resident {firstname} {lastname}. {lastname} has tried a number of creative planning strategies in the past only to be met with failure as most events end up heavily laden with testosterone.</p><p>Said a friend of the host, \"{firstname} is instituting restrictions on the guest list this time. Three girls will be invited for every one guy. In the back of my mind I know that it will still be infested with dudes though.\"</p><p>Despite obvious shortcomings, the fault may not lie with {lastname}. A recent study at the University of California, Santa Barbara, has shown that almost all parties have a high \"sausage\" risk factor with spring break blowouts and fraternity keggers topping the list. The study found that the only types of events consistently attended by more females than males are baby showers and group viewings of \"Ally McBeal.\"</p>','Dusty Eastgate'),(18,1,'public','business','{company} to lay off all useful employees','{city}- Local company, {company}, has planned additional layoffs which will include all intelligent or productive employees.  This decision was made due to tight budgets constraints and revenue shortfall.<p>Intelligent and productive employees were targeted for one reason, they are expensive to retain. The average smart/productive worker is paid at least 40% more than the average lackey type. Significant savings can be realized even if these intelligent workers are replaced by useless workers following the layoffs.<p>\"We see this move as crucial in the survival of {company}. We need to keep the office full of people to look productive to investors but can\'t afford the more skilled talent. We don\'t really produce anything tangible, so having smart and productive employees just causes confusion for everyone,\" stated {company} president {president}.<p>{company} has been primarily involved in the production of \"hot air\" for many years now.  This product requires remarkably little engineering or product development, but provides the perception of health and progress to the investment community.<p>Some of the savings realized in this next employee cut will be used to purchase nicer office furniture and re-design the corporate logo.','Roger Barrett'),(19,1,'public','local','{first} {last} verified as a \"Psycho ex-girlfriend\"','{city} - It has now been confirmed that {first} {last} is a \"Psycho ex-girlfriend.\"  {last} was apparently traumatized after being dumped by local resident, {date_first} {date_last}, and has been exhibiting mentally unstable behavior. <p>The relationship between {first} and {date_first} only lasted a couple weeks, but made a strong impression on {last} who suffers from hyper-low self esteem and obsessive-compulsive tendencies. <p>Their relationship was very superficial according to {date_first}. \"We hooked up at a bar a few weeks ago, and after that she was a great \'booty call\' as long as she got her ass out my house before I woke up the next morning,\" said {date_last}.<p>Following a discussion that should have terminated the relationship, {last} insisted on calling {date_first} a minimum of 12 times per day and made sure to \"block\" him from any interaction with other women.  This has seriously cramped {date_first}\'s style.  \"I can\'t get any work done at the clubs,\" stated {date_last}, \"she\'s always there and blows my deal!\" <p>{date_last} has since been forced to change his phone number, address, hair style, and frequented bars in order to live a \"psycho free\" life.  {date_last}, however, will not reveal any more information for fear of being found again by {last}.','Dusty Eastgate'),(20,1,'unlisted','entertainment,national,top-stories','Tourist Attacks Mickey Mouse','<p>Anaheim, CA - Disgruntled, and assumed insane tourist, {first} {last}, was apprehended by Disneyland security last Thursday when he began to beat on the beloved Mickey Mouse character, long-time icon of the Disney franchise.</p>\r\n<p>The incident occured while Mr. {last} and {company} were walking down \"Main Street, USA,\" a popular area of the Disneyland park, where many of the life-sized, costumed characters greet and interact with visitors.  Apparently {last} did not welcome the approach of Mickey Mouse, and reacted violently to the mouse\'s popular \"love hug.\"</p>\r\n<p>Mr. {last} grabbed Mickey around the neck and held him in a wrestler\'s choke hold while repeatedly punching him in the face and gut.  Children screamed as the beloved icon fell to the ground, where {last} continued to kick the character in the groin.</p>\r\n<p>Within moments, park security converged on the disturbance and restrained {last}, while other officers pulled the downed Mickey to safety.  Mr. {last} was quickly cuffed and thown into the park\'s holding room, while Anaheim police were called to remove and arrest the disgrunted park visitor.</p>\r\n<p>{first} {last} has since filed a lawsuit agaist The Walt Disney Co. for sexual harassment by Mickey Mouse, and for wrongfull expulsion from the park.  He\'s suing for $10,000,000 plus a credit for $44.95 (entrance fee to the park, lost during the incident).</p>\r\n<p>Parents of children who witnessed the event are encouraged to have their children call a special counseling hot-line set up by the Disney Company, (714) 555-4000.</p>','Kip Keylon'),(21,1,'public','science-and-technology','University study pinpoints {firstname} {lastname} as smartest living person','New York, NY - A three year study sponsored by Columbia University has determined that {firstname} {lastname} is undeniable the most intelligent currently living human on the planet.<p>The intelligence study was conducted by a team of scientists from around the globe. Test subjects were taken from numerous countries and walks of life. Each subject was graded on standard intelligence criteria, such as deductive reasoning, memory retention, learning ability, and overall logic skills.<p>{lastname} far surpassed other test subjects in every area by as much as 60% and proved to be almost too intelligent for the scientists to even communicate with.<p>\"I always suspected that I was quite a bit more intelligent than most other people,\" said {lastname}, \"particularly after dealing with the Motor Vehicle Bureau and watching summer blockbuster movies.\"<p>Publicity may have negative consequences for {firstname} {lastname}, as newfound fame may alienate the \"smartest person in the world\" from friends and colleagues.','Brian Mey');
/*!40000 ALTER TABLE `article_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_image`
--

DROP TABLE IF EXISTS `content_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_image` (
  `content_class` varchar(255) NOT NULL,
  `content_id` int(10) unsigned NOT NULL,
  `image_id` int(10) unsigned NOT NULL,
  `display_type` varchar(255) NOT NULL,
  `display_position` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`content_class`,`content_id`,`image_id`),
  KEY `fk_ai_image_id` (`image_id`),
  CONSTRAINT `fk_ai_image_id` FOREIGN KEY (`image_id`) REFERENCES `image` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_image`
--

LOCK TABLES `content_image` WRITE;
/*!40000 ALTER TABLE `content_image` DISABLE KEYS */;
INSERT INTO `content_image` VALUES ('ArticleTemplate',11,2,'primary',0),('ArticleTemplate',20,1,'primary',0);
/*!40000 ALTER TABLE `content_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mime_type` varchar(255) NOT NULL,
  `width` smallint(5) unsigned NOT NULL,
  `height` smallint(5) unsigned NOT NULL,
  `caption` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (1,'image/jpeg',856,380,NULL),(2,'image/jpeg',890,395,NULL);
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_info`
--

DROP TABLE IF EXISTS `login_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `provider_id` varchar(255) NOT NULL,
  `provider_key` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_info`
--

LOCK TABLES `login_info` WRITE;
/*!40000 ALTER TABLE `login_info` DISABLE KEYS */;
INSERT INTO `login_info` VALUES (1,'credentials','kip.sigman@gmail.com'),(2,'credentials','velatra@gmail.com'),(3,'credentials','Nsigman4624@gmail.com'),(4,'credentials','enalmada@gmail.com');
/*!40000 ALTER TABLE `login_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_info`
--

DROP TABLE IF EXISTS `password_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login_info_id` int(10) unsigned NOT NULL,
  `hasher` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pi_login_info_id` (`login_info_id`),
  CONSTRAINT `fk_pi_login_info_id` FOREIGN KEY (`login_info_id`) REFERENCES `login_info` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_info`
--

LOCK TABLES `password_info` WRITE;
/*!40000 ALTER TABLE `password_info` DISABLE KEYS */;
INSERT INTO `password_info` VALUES (1,1,'bcrypt','$2a$10$Gj2NxFe.7Lk1F1XthxicOedOXivafX2nU/1ODLgO0wTL4KX6IC99O',NULL),(2,2,'bcrypt','$2a$10$1xRVAJat3oqj.kyB/4a.0OJOCaGxpNXA4aWbGsDahQTVhdpjjpMcK',NULL),(3,3,'bcrypt','$2a$10$u39Eb4J4.K/7P5i.qdyec.fB5PFRjmz3qvkcvjBTjpYyH7SwXdqd.',NULL),(4,4,'bcrypt','$2a$10$Ye/Lqn9DOzspnSuN4RNQDewr7MbRMG8SKJIs94QJrJTxx71eSgs2u',NULL);
/*!40000 ALTER TABLE `password_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `avatar_url` varchar(255) DEFAULT NULL,
  `roles` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Kip','Sigman','kip.sigman@gmail.com','https://secure.gravatar.com/avatar/65085d389d133e2652e7fe14e9bf324a?d=404','administrator,editor,member'),(2,'Stanley','August','velatra@gmail.com',NULL,'member'),(3,'Nancy','Sigman','Nsigman4624@gmail.com',NULL,'member'),(4,'Adam','Lane','enalmada@gmail.com','https://secure.gravatar.com/avatar/9b0fc94a705397da32c0163dd883ba03?d=404','editor,member');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_login_info`
--

DROP TABLE IF EXISTS `user_login_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_login_info` (
  `user_id` int(10) unsigned NOT NULL,
  `login_info_id` int(10) unsigned NOT NULL,
  KEY `fk_uli_user_id` (`user_id`),
  KEY `fk_uli_login_info_id` (`login_info_id`),
  CONSTRAINT `fk_uli_login_info_id` FOREIGN KEY (`login_info_id`) REFERENCES `login_info` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_uli_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_login_info`
--

LOCK TABLES `user_login_info` WRITE;
/*!40000 ALTER TABLE `user_login_info` DISABLE KEYS */;
INSERT INTO `user_login_info` VALUES (1,1),(2,2),(3,3),(4,4);
/*!40000 ALTER TABLE `user_login_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-13 15:45:28
