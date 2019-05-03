function countryObj (countryCode, country, numericCode)
    {
    this.countryCode = countryCode;
    this.country = country;
    this.numericCode= numericCode;
    }
var productId;
var countryArr = new Array();
function countryArrInit () {
if (productId != "DSR-1000AC_Ax" && productId != "DSR-500AC_Ax") {
countryArr[0] = new countryObj(840,'United States','0x3A'); 
countryArr[1] = new countryObj(578,'Norway','0x37');
countryArr[2] = new countryObj(36,'Australia','0x23');
countryArr[3] = new countryObj(643,'Russia','0x3B');
countryArr[4] = new countryObj(356,'India','0x15');
countryArr[5] = new countryObj(999,'Latin America','0x51');
countryArr[6] = new countryObj(76,'Brazil','0x51');
countryArr[7] = new countryObj(4015,'Japan','0x37');
countryArr[8] = new countryObj(158,'Taiwan','0x50');
countryArr[9] = new countryObj(124,'Canada','0x14');
countryArr[10] = new countryObj(156,"People's Republic of China",'0x52');
countryArr[11] = new countryObj(376,'Israel','0x55');
countryArr[12] = new countryObj(702,'Singapore','0x5B');
countryArr[13] = new countryObj(392,'Japan','0x37');
}
else {
countryArr[0] = new countryObj(8,'Albania','0x37');
countryArr[1] = new countryObj(12,'Algeria','0x5A');
countryArr[2] = new countryObj(16,'American Samoa','0x3A');
countryArr[3] = new countryObj(32,'Argentina','0x3B');
countryArr[4] = new countryObj(51,'Armenia','0x30');
countryArr[5] = new countryObj(36,'Australia','0x23');
countryArr[6] = new countryObj(40,'Austria','0x37');
countryArr[7] = new countryObj(31,'Azerbaijan','0x30');

countryArr[8] = new countryObj(44,'Bahamas','0x3B');
countryArr[9] = new countryObj(48,'Bahrain','0x5B');
countryArr[10] = new countryObj(50,'Bangladesh','0x52');
countryArr[11] = new countryObj(52,'Barbados','0x21');
countryArr[12] = new countryObj(112,'Belarus','0x37');
countryArr[13] = new countryObj(56,'Belgium','0x37');
countryArr[14] = new countryObj(84,'Belize','0x55');
countryArr[15] = new countryObj(60,'Bermuda','0x3A');
countryArr[16] = new countryObj(68,'Bolivia','0x55');
countryArr[17] = new countryObj(70,'Bosnia and Herzegowina','0x37');
countryArr[18] = new countryObj(76,'Brazil','0x51');
countryArr[19] = new countryObj(96,'Brunei Darussalam','0x5B');
countryArr[20] = new countryObj(100,'Bulgaria','0x37');

countryArr[21] = new countryObj(116,'Cambodia','0x37');
countryArr[22] = new countryObj(124,'Canada','0x14');
countryArr[23] = new countryObj(152,'Chile','0x5B');
countryArr[24] = new countryObj(156,"China",'0x52'); 
countryArr[25] = new countryObj(170,'Colombia','0x3B');
countryArr[26] = new countryObj(188,'Costa Rica','0x3B');
countryArr[27] = new countryObj(191,'Croatia','0x37');
countryArr[28] = new countryObj(196,'Cyprus','0x37');
countryArr[29] = new countryObj(203,'Czech Republic','0x37');

countryArr[30] = new countryObj(208,'Denmark','0x37');
countryArr[31] = new countryObj(214,'Dominican Republic','0x10');

countryArr[32] = new countryObj(218,'Ecuador','0x3B');
countryArr[33] = new countryObj(818,'Egypt','0x36');
countryArr[34] = new countryObj(222,'EL Salvador','0x11');
countryArr[35] = new countryObj(233,'Estonia','0x37');

countryArr[36] = new countryObj(234,'Faeroe Islands','0x37');
countryArr[37] = new countryObj(246,'Finland','0x37');
countryArr[38] = new countryObj(250,'France','0x37');
countryArr[39] = new countryObj(254,'French Guiana','0x37');
countryArr[40] = new countryObj(258,'French Polynesia','0x37');

countryArr[41] = new countryObj(268,'Georgia','0x30');
countryArr[42] = new countryObj(276,'Germany','0x37');
countryArr[43] = new countryObj(300,'Greece','0x37');
countryArr[44] = new countryObj(304,'Greenland','0x37');
countryArr[45] = new countryObj(308,'Grenada','0x3A');
countryArr[46] = new countryObj(312,'Guadeloupe','0x37');
countryArr[47] = new countryObj(316,'Guam','0x3A');
countryArr[48] = new countryObj(320,'Guatemala','0x10');

countryArr[49] = new countryObj(332,'Haiti','0x37');
countryArr[50] = new countryObj(340,'Honduras','0x3B');
countryArr[51] = new countryObj(344,'Hong Kong','0x3B');
countryArr[52] = new countryObj(348,'Hungary','0x37');

countryArr[53] = new countryObj(352,'Iceland','0x37');
countryArr[54] = new countryObj(456,'India','0x15');
countryArr[55] = new countryObj(360,'Indonesia','0x45');
countryArr[56] = new countryObj(364,'Iran','0x52');
countryArr[57] = new countryObj(368,'Iraq','0x37');
countryArr[58] = new countryObj(372,'Ireland','0x37');
countryArr[59] = new countryObj(612,'Israel','0x55');
countryArr[60] = new countryObj(380,'Italy','0x37');

countryArr[61] = new countryObj(388,'Jamaica','0x3B');
countryArr[62] = new countryObj(4015,'Japan','0x37');
countryArr[63] = new countryObj(400,'Jordan','0x42');

countryArr[64] = new countryObj(398,'Kazakhstan','0x03');
countryArr[65] = new countryObj(404,'Kenya','0x51');
countryArr[66] = new countryObj(408,'North Korea','0x5E');
countryArr[67] = new countryObj(410,'South Korea','0x5F');
countryArr[68] = new countryObj(411,'South Korea','0x49');
countryArr[69] = new countryObj(412,'South Korea','0x5E');
countryArr[70] = new countryObj(414,'Kuwait','0x36');

countryArr[71] = new countryObj(428,'Latvia','0x37');
countryArr[72] = new countryObj(422,'Lebanon','0x3B');
countryArr[73] = new countryObj(434,'Libya','0x37');
countryArr[74] = new countryObj(438,'Liechtenstein','0x37');
countryArr[75] = new countryObj(440,'Lithuania','0x37');
countryArr[76] = new countryObj(442,'Luxembourg','0x37');

countryArr[77] = new countryObj(446,'Macau SAR','0x52');
countryArr[78] = new countryObj(807,'Macedonia, The Former Yugoslav Republic Of','0x37');
countryArr[79] = new countryObj(454,'Malawi','0x37');
countryArr[80] = new countryObj(458,'Malaysia','0x11');
countryArr[81] = new countryObj(462,'Maldives','0x37');
countryArr[82] = new countryObj(470,'Malta','0x37');
countryArr[83] = new countryObj(474,'Martinique','0x37');
countryArr[84] = new countryObj(480,'Mauritius','0x3B');
countryArr[85] = new countryObj(175,'Mayotte','0x37');
countryArr[86] = new countryObj(484,'Mexico','0x3B');
countryArr[87] = new countryObj(492,'Monaco','0x37');
countryArr[88] = new countryObj(496,'Mongolia','0x3B');
countryArr[89] = new countryObj(504,'Morocco','0x36');

countryArr[90] = new countryObj(524,'Nepal','0x5B');
countryArr[91] = new countryObj(528,'Netherlands','0x37');
countryArr[92] = new countryObj(530,'Netherlands Antilles','0x37');
countryArr[93] = new countryObj(533,'Aruba','0x37'); /*Aruba */
countryArr[94] = new countryObj(554,'New Zealand','0x3F');
countryArr[95] = new countryObj(558,'Nicaragua','0x3A');
countryArr[96] = new countryObj(566,'Nigeria','0x5D');
countryArr[97] = new countryObj(578,'Norway','0x37');
countryArr[98] = new countryObj(580,'Northern Mariana Islands','0x3A');

countryArr[99] = new countryObj(512,'Oman','0x37');

countryArr[100] = new countryObj(586,'Pakistan','0x52');
countryArr[101] = new countryObj(591,'Panama','0x10');
countryArr[102] = new countryObj(598,'Papua New Guinea','0x3B');
countryArr[103] = new countryObj(600,'Paraguay','0x3B');
countryArr[104] = new countryObj(604,'Peru','0x3B');
countryArr[105] = new countryObj(608,'Republic of the Philippines','0x3B');
countryArr[106] = new countryObj(616,'Poland','0x37');
countryArr[107] = new countryObj(620,'Portugal','0x37');
countryArr[108] = new countryObj(630,'Puerto Rico','0x3A');

countryArr[109] = new countryObj(634,'Qatar','0x52');

countryArr[110] = new countryObj(638,'Reunion','0x37');
countryArr[111] = new countryObj(642,'Romania','0x37');
countryArr[112] = new countryObj(643,'Russian Federation','0x3B');
countryArr[113] = new countryObj(646,'Rwanda','0x3B');

countryArr[114] = new countryObj(682,'Saudi Arabia','0x37');
countryArr[115] = new countryObj(688,'Serbia','0x37');
countryArr[116] = new countryObj(499,'Montenegro','0x37'); /*Montenegro */
countryArr[117] = new countryObj(702,'Singapore','0x5B');
countryArr[118] = new countryObj(703,'Slovak Republic','0x37');
countryArr[119] = new countryObj(705,'Slovenia','0x37');
countryArr[120] = new countryObj(710,'South Africa','0x37');
countryArr[121] = new countryObj(724,'Spain','0x37');
countryArr[122] = new countryObj(144,'Sri Lanka','0x3B');
countryArr[123] = new countryObj(752,'Sweden','0x37');
countryArr[124] = new countryObj(756,'Switzerland','0x37');
countryArr[125] = new countryObj(760,'Syria','0x03');

countryArr[126] = new countryObj(158,'Taiwan','0x50');
countryArr[127] = new countryObj(834,'Tanzania','0x52');
countryArr[128] = new countryObj(764,'Thailand','0x3B');
countryArr[129] = new countryObj(780,'Trinidad And Tobago','0x3B');
countryArr[130] = new countryObj(788,'Tunisia','0x36');
countryArr[131] = new countryObj(792,'Turkey','0x37');

countryArr[132] = new countryObj(784,'United Arab Emirates','0x3B');
countryArr[133] = new countryObj(800,'Uganda','0x5F');
countryArr[134] = new countryObj(804,'Ukraine','0x3E');
countryArr[135] = new countryObj(826,'United Kingdom','0x37');
countryArr[136] = new countryObj(840,'United States','0x3A');
countryArr[137] = new countryObj(841,'United States for AP','0x14');
countryArr[138] = new countryObj(842,'United States (Public Safety)','0x12');
countryArr[139] = new countryObj(858,'Uruguay','0x3B');
countryArr[140] = new countryObj(860,'Uzbekistan','0x3A');

countryArr[141] = new countryObj(862,'Venezuela','0x11');
countryArr[142] = new countryObj(704,'Viet Nam','0x3B');
countryArr[143] = new countryObj(850,'Virgin Islands(U.S.)','0x3A');

countryArr[144] = new countryObj(887,'Yemen','0x03');

countryArr[145] = new countryObj(716,'Zimbabwe','0x37');

countryArr[146] = new countryObj(999,'Latin America','0x51');
}
}
function displayCountryCode ()
	{
		var regionInfoObj = document.getElementById('hdRegionInfo');
		if(!regionInfoObj) return;
		var regionInfoObjVal = regionInfoObj.value;
		var wLanObj = document.getElementById('tf1_wlanVal');
		var unitName = document.getElementById('hdUnitName').value;
		/* First we set the object to Not Available */
		wLanObj.innerHTML =  LANG_LOCALE['30499'];
		for(var i=0 ; i < countryArr.length; i++)
			{
		                /* check Country code against our array. */
				if(countryArr[i].countryCode ==  regionInfoObjVal)
					{
		                                /* set appropriate Numeric value. */
						if(unitName == "DSR-1000N" || unitName == "DSR-500N" || unitName == "DSR-250N" || unitName == "DSR-150N" || productId == "DSR-1000AC_Ax" || productId == "DSR-500AC_Ax")
						{
						wLanObj.innerHTML =  countryArr[i].numericCode;
						}
						break;
					} 
			}
	}

function displayChannelList ()
	{
          
	var tdObj = document.getElementById ('tf1_tdChanList');
	if (!tdObj) return;
	
    /* pick the correct ISO country code corresponding to atheros country code */
	var regionInfoObj = document.getElementById('hdRegionInfo');
	if(!regionInfoObj) return;
	var regionInfoObjVal = regionInfoObj.value;
		
	var cntryobj = document.getElementById ('hdWlanCountry');
	for (count =0; count < wlNwAthObjLst.length; count++)
		{
		try {
			if (wlNwAthObjLst[count].countryCode == regionInfoObjVal)
				{
				cntryobj.value = wlNwAthObjLst[count].countryISOName;
				break;
				}
			} catch (err) {}
		}
	
    var chLst1 = null;
    for (var i = 0; i < wlNwObjLst.length; i++)
    	{
    	if (wlNwObjLst[i].countryCode == cntryobj.value)
    		{
    		chLst1 = wlNwObjLst[i].chSp20NgChLst;
    		chLst2 = wlNwObjLst[i].chSp20NaChLst;
    		break;
    		}
    	}
    	/* 20 MHz channels for 2.4GHz radio starts*/
	var chLstStr = "";
    if (chLst1 != null)
    	{
	    for (var chIdx = 0; chIdx < chLst1.length; chIdx++)
        	{
        	if (chIdx == (chLst1.length - 1))
				chLstStr += chLst1[chIdx];
        	else
				chLstStr += chLst1[chIdx] + ", ";
			}
		}
		/* 20 MHz channels for 2.4GHz radio ends*/

    if (productId == "DSR-1000AC_Ax" || productId == "DSR-500AC_Ax") {
        /* 20 MHz channels for 5GHz radio starts*/
	    var chLstStr2 ="";
		if (chLst2 != null)
    	{
	    for (var chIdx = 0; chIdx < chLst2.length; chIdx++)
        	{
        	if (chIdx == (chLst2.length - 1))
				chLstStr2 += chLst2[chIdx];
        	else
				chLstStr2 += chLst2[chIdx] + ", ";
			}
		}
		/* 20 MHz channels for 5GHz radio ends*/
        tdObj.innerHTML = chLstStr +", "+chLstStr2;
    }
    else {
        tdObj.innerHTML = chLstStr;
    }
	}

function check