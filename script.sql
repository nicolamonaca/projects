----------------------------------------------------------
--                   ** Freefall **                     --
----------------------------------------------------------
-- Version: 1.0                                         --
-- Last Revision: March 20, 2013                        --
-- Project Website: http://wp.me/P2pHhR-2S              --
----------------------------------------------------------
----------------------------------------------------------
-- Author: Nicola Lamonaca                              --
-- Author's Profile: it.linkedin.com/in/nicolamonaca/   --
-- Email: nicola.lamonaca@gmail.com                     --
----------------------------------------------------------



-------------------------------
-- BEGIN SCHEMATA DEFINITION --
-------------------------------

DROP SCHEMA IF EXISTS support CASCADE;
CREATE SCHEMA support;

DROP SCHEMA IF EXISTS freefall CASCADE;
CREATE SCHEMA freefall;

-----------------------------
-- END SCHEMATA DEFINITION --
-----------------------------




------------------------------
-- BEGIN DOMAINS DEFINITION --
------------------------------

DROP DOMAIN IF EXISTS support.CountryCodes_d CASCADE;
-- Here we define the admitted values for country codes used to model telephone numbers
CREATE DOMAIN support.CountryCodes_d AS TEXT
CONSTRAINT CountryCodes_d_check CHECK (
	VALUE IN (
	'39', '1', '20', '212', '213', '216', '218', '220', '221', '222', '223', '224', '225', '226', '227', '228', '229', '230', '231', '232', '233', '234', '235', '236', '237', '238', '239', '240', '241', '242', '243', '244', '245', '248', 
'249', '250', '251', '252', '253', '254', '255', '256', '257', '258', '260', '261', '262', '263', '264', '265', '266', '267', '268', '269', '27', '290', '291', '297', '298', '299', '30', '31', '32', '33', '34', '350', '351', '352', 
'353', '354', '355', '356', '357', '358', '359', '36', '370', '371', '372', '373', '374', '375', '376', '377', '378', '380', '381', '382', '385', '386', '387', '40', '41', '420', '421', '423', '43', '44', '45', '46', '47', '48', 
'49', '500', '501', '502', '503', '504', '505', '506', '507', '508', '509', '51', '52', '53', '54', '55', '56', '57', '58', '590', '591', '592', '593', '595', '597', '598', '599', '60', '61', '62', '63', '64', '65', '66', '670', '672', 
'673', '674', '675', '676', '677', '678', '679', '680', '681', '682', '683', '685', '686', '687', '688', '689', '690', '691', '692', '7', '81', '82', '84', '850', '852', '853', '855', '856', '86', '870', '880', '886', '90', '91', '92', 
'93', '94', '95', '960', '961', '962', '963', '964', '965', '966', '967', '968', '970', '971', '972', '973', '974', '975', '976', '977', '98', '992', '993', '994', '995', '996', '998', '1242', '1246', '1264', '1268', '1284', '1340', 
'1345', '1441', '1473', '1599', '1649', '1664', '1670', '1671', '1684', '1758', '1767', '1784', '1809', '1868', '1869', '1876')
);




DROP DOMAIN IF EXISTS support.OperatorPrefixes_d CASCADE;
-- Here we define all the admitted italian operator prefixes used to model cell phone numbers
CREATE DOMAIN support.OperatorPrefixes_d AS TEXT
CONSTRAINT OperatorPrefixes_d_check CHECK (
	VALUE IN (
	'310', '311', '313', '314', '315', '330', '331', '333', '334', '335', '336', '337', '338', '339', '360', '363', '366', '368', '340', '342', '345', '346', '347', '348', '349', '320', '323', '327', '328', '329', '380', '383', '388', '390', '391', '392', '393', 
'389', '373')
);


DROP DOMAIN IF EXISTS freefall.FreefallPrefixes_d CASCADE;
-- Here we define all the valid values for Freefall prefixes.
CREATE DOMAIN freefall.FreefallPrefixes_d AS support.OperatorPrefixes_d
CONSTRAINT FreefallPrefixes_d_check CHECK (
	VALUE IN (
	'310', '311', '313', '314', '315')
);




DROP DOMAIN IF EXISTS support.TownPrefixes_d CASCADE;
-- These are al the admitted values for italian town prefixes used to model home phone numbers
CREATE DOMAIN support.TownPrefixes_d AS TEXT
CONSTRAINT TownPrefixes_d_check CHECK (
	VALUE IN (
       '010', '011', '0121', '0122', '0123', '0124', '0125', '0131', '0141', '0142', '0143', '0144', '015', '0161', '0163', '0165', '0166', '0171', '0172', '0173', '0174', '0175', '0182', '0183', '0184', '0185', '0187', '019', '02', 
'030', '031', '0321', '0322', '0323', '0324', '0331', '0332', '0341', '0342', '0343', '0344', '0345', '0346', '035', '0362', '0363', '0364', '0365', '0371', '0372', '0373', '0374', '0375', '0376', '0377', '0381', '0382', '0383', 
'0384', '0385', '0386', '039', '040', '041', '0421', '0422', '0423', '0424', '0425', '0426', '0427', '0428', '0429', '0431', '0432', '0433', '0434', '0435', '0436', '0437', '0438', '0439', '0442', '0444', '0445', '045', '0461', '0462', 
'0463', '0464', '0465', '0471', '0472', '0473', '0474', '0481', '049', '050', '051', '0521', '0522', '0523', '0524', '0525', '0532', '0533', '0534', '0535', '0536', '0541', '0542', '0543', '0544', '0545', '0546', '0547', '0549', '055', 
'0564', '0565', '0566', '0571', '0572', '0573', '0574', '0575', '0577', '0578', '0583', '0584','0585', '0586', '0587', '0588', '059', '06', '070', '071', '0721', '0722', '0731', '0732', '0733', '0734', '0735', '0736', '0737', '0742', 
'0743', '0744', '0746', '075', '0761', '0763', '0765', '0766', '0771', '0773', '0774', '0775', '0776', '0781', '0782', '0783', '0784', '0785', '0789', '079', '080', '081', '0823', '0824', '0825', '0827', '0828', '0831', '0832', '0833', 
'0835', '0836', '085', '0861', '0862', '0863', '0864', '0865', '0871', '0872', '0873', '0874', '0875', '0881', '0882', '0883', '0884', '0885', '089', '090', '091', '0921', '0922', '0923', '0924', '0925', '0931', '0932', '0933', '0934', 
'0935', '0941', '0942', '095', '0961', '0962', '0963', '0964', '0965', '0966', '0967', '0968', '0971', '0972', '0973', '0974', '0975', '0976', '0981', '0982', '0983', '0984', '0985', '099')
);




DROP DOMAIN IF EXISTS support.States_d CASCADE;
-- Following are the names of all the world nations used in addresses
CREATE DOMAIN support.States_d AS TEXT
CONSTRAINT States_d_check CHECK (
	VALUE IN (
       'Afghanistan', 'Albania', 'Algeria', 'American Samoa', 'Andorra', 'Angola', 'Anguilla', 'Antarctica', 'Antigua and Barbuda', 'Argentina', 'Armenia', 'Aruba', 'Australia', 'Austria', 'Azerbaijan', 'Bahamas', 'Bahrain', 
'Bangladesh', 'Barbados', 'Belarus', 'Belgium', 'Belize', 'Benin', 'Bermuda', 'Bhutan', 'Bolivia', 'Bosnia and Herzegovina', 'Botswana', 'Brazil', 'Brunei Darussalam', 'Bulgaria', 'Burkina Faso', 'Burundi', 'Cambodia', 'Cameroon', 
'Canada', 'Cape Verde', 'Cayman Islands', 'Central African Republic', 'Chad', 'Chile', 'China', 'Christmas Island', 'Cocos Islands', 'Colombia', 'Comoros', 'Congo, Democratic Republic of', 'Congo, Republic of', 'Cook Islands', 'Costa 
Rica', 'Ivory Coast', 'Croatia', 'Cuba', 'Cyprus', 'Czech Republic', 'Denmark', 'Djibouti', 'Dominica', 'Dominican Republic', 'East Timor', 'Ecuador', 'Egypt', 'El Salvador', 'Equatorial Guinea', 'Eritrea', 'Estonia', 'Ethiopia', 
'Falkland Islands', 'Faroe Islands', 'Fiji', 'Finland', 'France', 'French Guiana', 'French Polynesia', 'French Southern Territories', 'Gabon', 'Gambia', 'Georgia', 'Germany', 'Ghana', 'Gibraltar', 'Great Britain', 'Greece', 
'Greenland', 'Grenada', 'Guadeloupe', 'Guam', 'Guatemala', 'Guinea', 'Guinea-Bissau', 'Guyana', 'Haiti', 'Honduras', 'Hong Kong', 'Hungary', 'Iceland', 'India', 'Indonesia', 'Iran, Islamic Republic of', 'Iraq', 'Ireland', 'Israel', 
'Italy', 'Jamaica', 'Japan', 'Jordan', 'Kazakhstan', 'Kenya', 'Kiribati', 'Korea, Democratic Peoples Republic', 'Korea, Republic of', 'Kosovo', 'Kuwait', 'Kyrgyzstan', 'Lao, Peoples Democratic Republic of', 'Latvia', 'Lebanon', 
'Lesotho', 'Liberia', 'Libya', 'Liechtenstein', 'Lithuania', 'Luxembourg', 'Macau', 'Macedonia, Republic of', 'Madagascar', 'Malawi', 'Malaysia', 'Maldives', 'Mali', 'Malta', 'Marshall Islands', 'Martinique', 'Mauritania', 'Mauritius', 
'Mayotte', 'Mexico', 'Micronesia, Federal States of', 'Moldova, Republic of', 'Monaco', 'Mongolia', 'Montenegro', 'Montserrat', 'Morocco', 'Mozambique', 'Myanmar', 'Namibia', 'Nauru', 'Nepal', 'Netherlands', 'Netherlands Antilles', 
'New Caledonia', 'New Zealand', 'Nicaragua', 'Niger', 'Nigeria', 'Niue', 'Northern Mariana Islands', 'Norway', 'Oman', 'Pakistan', 'Palau', 'Palestinian territories', 'Panama', 'Papua New Guinea', 'Paraguay', 'Peru', 'Philippines', 
'Pitcairn Island', 'Poland', 'Portugal', 'Puerto Rico', 'Qatar', 'Reunion Island', 'Romania', 'Russian Federation', 'Rwanda', 'Saint Kitts and Nevis', 'Saint Lucia', 'Saint Vincent and the Grenadines', 'Samoa', 'San Marino', 'Sao Tome 
and Principe', 'Saudi Arabia', 'Senegal', 'Serbia', 'Seychelles', 'Sierra Leone', 'Singapore', 'Slovakia', 'Slovenia', 'Solomon Islands', 'Somalia', 'South Africa', 'South Sudan', 'Spain', 'Sri Lanka', 'Sudan', 'Suriname', 'Swaziland', 
'Sweden', 'Switzerland', 'Syria', 'Taiwan', 'Tajikistan', 'Tanzania', 'Thailand', 'Tibet', 'Timor-Leste', 'Togo', 'Tokelau', 'Tonga', 'Trinidad and Tobago', 'Tunisia', 'Turkey', 'Turkmenistan', 'Turks and Caicos Islands', 'Tuvalu', 
'Uganda', 'Ukraine', 'United Arab Emirates', 'United Kingdom', 'United States', 'Uruguay', 'Uzbekistan', 'Vanuatu', 'Vatican City State', 'Venezuela', 'Vietnam', 'Virgin Islands (British)', 'Virgin Islands (U.S.)', 'Wallis and Futuna 
Islands', 'Western Sahara', 'Yemen', 'Zambia', 'Zimbabwe' )
);




DROP DOMAIN IF EXISTS support.PlanTypes_d CASCADE;
-- Here we define the two kinds of possible price plans
CREATE DOMAIN support.PlanTypes_d AS TEXT
CONSTRAINT PlanTypes_d_check CHECK (
VALUE IN (
	'g', --'g' = 'Pay & Go'
	'm'  --'m' = 'Pay Monthly'
	)
);




DROP DOMAIN IF EXISTS support.CurrencyCodes_d CASCADE;
-- Here we define all the currency codes used to model any kind of bank account
CREATE DOMAIN support.CurrencyCodes_d AS TEXT
CONSTRAINT CurrencyCodes_d_check CHECK (
	VALUE IN (
       'AED', 'AFN', 'ALL', 'AMD', 'ANG', 'AOA', 'ARS', 'AUD', 'AWG', 'AZN', 'BAM', 'BBD', 'BDT', 'BGN', 'BHD', 'BIF', 'BMD', 'BND', 'BOB', 'BRL', 'BSD', 'BTN', 'BWP', 'BYR', 'BZD', 'CAD', 'CDF', 'CHF', 'CLP', 'CNY', 'COP', 'CRC', 
'CUC', 'CUP', 'CVE', 'CZK', 'DJF', 'DKK', 'DOP', 'DZD', 'EGP', 'ERN', 'ETB', 'EUR', 'FJD', 'FKP', 'GBP', 'GEL', 'GGP', 'GHS', 'GIP', 'GMD', 'GNF', 'GTQ', 'GYD', 'HKD', 'HNL', 'HRK', 'HTG', 'HUF', 'IDR', 'ILS', 'IMP', 'INR', 'IQD', 
'IRR', 'ISK', 'JEP', 'JMD', 'JOD', 'JPY', 'KES', 'KGS', 'KHR', 'KMF', 'KPW', 'KRW', 'KWD', 'KYD', 'KZT', 'LAK', 'LBP', 'LKR', 'LRD', 'LSL', 'LTL', 'LVL', 'LYD', 'MAD', 'MDL', 'MGA', 'MKD', 'MMK', 'MNT', 'MOP', 'MRO', 'MUR', 'MVR', 
'MWK', 'MXN', 'MYR', 'MZN', 'NAD', 'NGN', 'NIO', 'NOK', 'NPR', 'NZD', 'OMR', 'PAB', 'PEN', 'PGK', 'PHP', 'PKR', 'PLN', 'PYG', 'QAR', 'RON', 'RSD', 'RUB', 'RWF', 'SAR', 'SBD', 'SCR', 'SDG', 'SEK', 'SGD', 'SHP', 'SLL', 'SOS', 'SPL', 
'SRD', 'STD', 'SVC', 'SYP', 'SZL', 'THB', 'TJS', 'TMT', 'TND', 'TOP', 'TRY', 'TTD', 'TVD', 'TWD', 'TZS', 'UAH', 'UGX', 'USD', 'UYU', 'UZS', 'VEF', 'VND', 'VUV', 'WST', 'XAF', 'XCD', 'XDR', 'XOF', 'XPF', 'YER', 'ZAR', 'ZMK', 'ZWD' )
);




DROP DOMAIN IF EXISTS support.StateCodes_d CASCADE;
-- This defines the codes of all the countries in the world. These are used to model the IBAN
CREATE DOMAIN support.StateCodes_d AS TEXT
CONSTRAINT StateCodes_d_check CHECK (
	VALUE IN (
      'AF', 'AL', 'AG', 'AN', 'AO', 'AC', 'AR', 'AM', 'AS', 'AU', 'AJ', 'BF', 'BA', 'BG', 'BB', 'BO', 'BE', 'BH', 'BN', 'BT', 'BL', 'BK', 'BC', 'BR', 'BX', 'BU', 'UV', 'BM', 'BY', 'CB', 'CM', 'CA', 'CV', 'CT', 'CD', 'CI', 'CH', 'CO', 
'CN', 'CF', 'CG', 'CS', 'IV', 'HR', 'CU', 'CY', 'EZ', 'DA', 'DJ', 'DO', 'DR', 'EC', 'EG', 'ES', 'EK', 'ER', 'EN', 'ET', 'FJ', 'FI', 'FR', 'GB', 'GA', 'GG', 'GM', 'GH', 'GR', 'GJ', 'GT', 'GV', 'PU', 'GY', 'HA', 'VT', 'HO', 'HU', 'IC', 
'IN', 'ID', 'IR', 'IZ', 'EI', 'IS', 'IT', 'JM', 'JA', 'JO', 'KZ', 'KE', 'KR', 'KN', 'KS', 'KV', 'KU', 'KG', 'LA', 'LG', 'LE', 'LT', 'LI', 'LY', 'LS', 'LH', 'LU', 'MK', 'MA', 'MI', 'MY', 'MV', 'ML', 'MT', 'RM', 'MR', 'MP', 'MX', 'FM', 
'MD', 'MN', 'MG', 'MJ', 'MO', 'MZ', 'WA', 'NR', 'NP', 'NL', 'NZ', 'NU', 'NG', 'NI', 'NO', 'MU', 'PK', 'PS', 'PM', 'PP', 'PA', 'PE', 'RP', 'PL', 'PO', 'QA', 'RO', 'RS', 'RW', 'SC', 'ST', 'VC', 'WS', 'SM', 'TP', 'SA', 'SG', 'RI', 'SE', 
'SL', 'SN', 'LO', 'SI', 'BP', 'SO', 'SF', 'OD', 'SP', 'CE', 'SU', 'NS', 'WZ', 'SW', 'SZ', 'SY', 'TI', 'TZ', 'TH', 'TT', 'TO', 'TN', 'TD', 'TS', 'TU', 'TX', 'TV', 'UG', 'UP', 'AE', 'UK', 'US', 'UY', 'UZ', 'NH', 'VE', 'VM', 'YM', 'ZA', 
'ZI')
);

----------------------------
-- END DOMAINS DEFINITION --
----------------------------




--------------------
-- START REQUIRED --
--------------------

-- We perform this transformation because 'comuni' table results in an unknown SRID by default
-- and spatial operations would not work as they would be in operations on mixed geometries
SELECT UpdateGeometrySRID('public', 'comuni', 'geom', 23032);


DROP TABLE IF EXISTS freefall.TelephoneNumber CASCADE;

CREATE TABLE freefall.TelephoneNumber (
	telephoneNumber_ID serial PRIMARY KEY,
	countryCode support.CountryCodes_d NOT NULL
);




DROP TABLE IF EXISTS freefall.CellPhoneNumber CASCADE;

CREATE TABLE freefall.CellPhoneNumber (
	operatorPrefix support.OperatorPrefixes_d NOT NULL,
	coreNumber text NOT NULL,
	cellPhoneNumber_ID serial PRIMARY KEY
) INHERITS(freefall.TelephoneNumber);




DROP TABLE IF EXISTS freefall.HomePhoneNumber CASCADE;

CREATE TABLE freefall.HomePhoneNumber (
	townPrefix support.TownPrefixes_d NOT NULL,
	coreNumber text NOT NULL,
	homePhoneNumber_ID serial PRIMARY KEY -- Currently not used
) INHERITS(freefall.TelephoneNumber);




DROP TABLE IF EXISTS freefall.FreefallCellPhoneNumber CASCADE;

CREATE TABLE freefall.FreefallCellPhoneNumber (
	freefallPrefix freefall.FreefallPrefixes_d NOT NULL,
	coreNumber text NOT NULL,
	assigned boolean,
	freefallNumber_ID serial PRIMARY KEY
) INHERITS(freefall.TelephoneNumber);




DROP TABLE IF EXISTS freefall.FreefallPrefixes CASCADE;
-- Here we store all Freefall's cell phone number prefixes
CREATE TABLE freefall.FreefallPrefixes (
	prefix_ID serial PRIMARY KEY,
	freefallPrefix freefall.FreefallPrefixes_d
);



-- Populate the 'FreefallPrefixes' table inserting some Freefall prefixes 
DELETE FROM freefall.FreefallPrefixes;
INSERT INTO freefall.FreefallPrefixes VALUES(DEFAULT, '310');
INSERT INTO freefall.FreefallPrefixes VALUES(DEFAULT, '311');
INSERT INTO freefall.FreefallPrefixes VALUES(DEFAULT, '313');
INSERT INTO freefall.FreefallPrefixes VALUES(DEFAULT, '314');
INSERT INTO freefall.FreefallPrefixes VALUES(DEFAULT, '315');



/******************/
/** EXTENSION #1 **/
/******************/
DROP FUNCTION IF EXISTS populate_freefall_cellphone_numbers_table_FNC(int, support.StateCodes_d);
-- FUNCTION: populate_freefall_cellphone_numbers_table_FNC(int, support.StateCodes_d)
---- DESCRIPTION: it generates K random cellphone numbers and puts them into the 'FreefallCellPhoneNumbers' table.
----              For i,j in [1, K], i<j, if number_j = number_i it attempts to generate new cellphone numbers.
---- in: K = how many cellphone numbers are to be generated
---- in: stateCode = the ID of the nation identifying the format in which cellphone numbers must be generated
---- out: none
---- USAGE: "SELECT populate_freefall_cellphone_numbers_table_FNC(50, 'IT');"
---- OUTPUT: /
CREATE FUNCTION populate_freefall_cellphone_numbers_table_FNC(K int, stateCode support.StateCodes_d) RETURNS VOID AS
$$
	DECLARE existingCellPhoneNumber freefall.CellPhoneNumber;

	DECLARE N int;
	DECLARE alreadyGeneratedNumbers int := 0;

	DECLARE newCountryCode text;
	DECLARE newPrefix text;
	DECLARE newCoreNumber text;
	
	DECLARE core1 text;
	DECLARE core2 text;
	
	BEGIN
		-- First get the number of tuples in the 'FreefallPrefixes' table
		SELECT COUNT(*) INTO N FROM freefall.FreefallPrefixes;

		INSERT INTO freefall.freefallCellPhoneNumber VALUES(DEFAULT, '39', '315', '9442326', FALSE, DEFAULT);
		INSERT INTO freefall.freefallCellPhoneNumber VALUES(DEFAULT, '39', '311', '8222102', FALSE, DEFAULT);
		INSERT INTO freefall.freefallCellPhoneNumber VALUES(DEFAULT, '39', '313', '5627886', FALSE, DEFAULT);

		IF(K > 0) THEN
			-- This tells how many cellphone numbers must be created
			FOR i IN 1 .. K-3 LOOP
				-- This tells how to generate *ITALIAN* cellphone numbers.
				CASE WHEN stateCode = 'IT' THEN	
					-- Create a new country code.
					newCountryCode := '39';
					
					-- Generate a new random prefix among the Freefall's ones.
					SELECT freefallPrefix::text INTO newPrefix
					FROM GENERATE_SERIES(1, N), freefall.FreefallPrefixes
					ORDER BY RANDOM()
					LIMIT 1;
					
					-- Generate a new core number.
					-- STEP 1
					SELECT number1::text INTO core1
					FROM GENERATE_SERIES(1000, 9999) AS number1
					ORDER BY RANDOM()
					LIMIT 1;
						-- STEP 2
						SELECT number2::text INTO core2
						FROM GENERATE_SERIES(100, 999) AS number2
						ORDER BY RANDOM()
						LIMIT 1;
							-- STEP 3
							SELECT (core1 || core2) INTO newCoreNumber;
					
					-- ..check it doesn't already exist in the 'CellPhoneNumber' table
					SELECT FCPN.countryCode, FCPN.freefallPrefix, FCPN.coreNumber
					FROM freefall.FreefallCellPhoneNumber FCPN
					INTO existingCellPhoneNumber
					WHERE
						FCPN.countryCode = newCountryCode
					AND 	FCPN.freefallPrefix = newPrefix
					AND 	FCPN.coreNumber = newCoreNumber;
					
					-- If the randomly-generated cellphone number does not exist in the 'CellPhoneNumber' table..
					IF(existingCellPhoneNumber IS NULL) THEN
						-- ..then OK: return it 
						INSERT INTO freefall.FreefallCellPhoneNumber VALUES(DEFAULT, newCountryCode, newPrefix, newCoreNumber, FALSE, DEFAULT);
						-- Count how many freefall cellphone numbers we generated so far
						alreadyGeneratedNumbers := alreadyGeneratedNumbers + 1;
					-- Otherwise..
					ELSE
						-- ..generate K - 'alreadyGeneratedNumbers' new random freefall cellphone numbers
						SELECT populate_freefall_cell_numbers_FNC(K - alreadyGeneratedNumbers - 3, stateCode);
					END IF;
				ELSE
					RAISE EXCEPTION '--------------------';
					RAISE EXCEPTION 'StateCode not valid.';
					RAISE EXCEPTION '--------------------';
				END CASE;
			END LOOP;
		END IF;
 	END;
$$
LANGUAGE 'plpgsql';




DROP TABLE IF EXISTS support.LodiProvinceIstatCodes CASCADE;
-- Here we register istat codes and names of the 61 cities in the province of Lodi, Italy
CREATE TABLE support.LodiProvinceIstatCodes (
	istatCode int PRIMARY KEY,
	city text
);




-- Populate the 'LodiProvinceIstatCodes' table with istat codes and city names
DELETE FROM support.LodiProvinceIstatCodes;
INSERT INTO support.LodiProvinceIstatCodes VALUES(98001, 'Abbadia Cerreto');
INSERT INTO support.LodiProvinceIstatCodes VALUES(98002, 'Bertonico');
INSERT INTO support.LodiProvinceIstatCodes VALUES(98003, 'Boffalora d''Adda');
INSERT INTO support.LodiProvinceIstatCodes VALUES(98004, 'Borghetto Lodigiano');
INSERT INTO support.LodiProvinceIstatCodes VALUES(98005, 'Borgo San Giovanni');
INSERT INTO support.LodiProvinceIstatCodes VALUES(98006, 'Brembio');
INSERT INTO support.LodiProvinceIstatCodes VALUES(98007, 'Camairago');
INSERT INTO support.LodiProvinceIstatCodes VALUES(98008, 'Casaletto Lodigiano');
INSERT INTO support.LodiProvinceIstatCodes VALUES(98009, 'Casalmaiocco');
INSERT INTO support.LodiProvinceIstatCodes VALUES(98010, 'Casalpusterlengo');
INSERT INTO support.LodiProvinceIstatCodes VALUES(98011, 'Caselle Landi');
INSERT INTO support.LodiProvinceIstatCodes VALUES(98012, 'Caselle Lurani');
INSERT INTO support.LodiProvinceIstatCodes VALUES(98013, 'Castelnuovo Bocca d''Adda');
INSERT INTO support.LodiProvinceIstatCodes VALUES(98014, 'Castiglione d''Adda');
INSERT INTO support.LodiProvinceIstatCodes VALUES(98015, 'Castiraga Vidardo');
INSERT INTO support.LodiProvinceIstatCodes VALUES(98016, 'Cavacurta');
INSERT INTO support.LodiProvinceIstatCodes VALUES(98017, 'Cavenago d''Adda');
INSERT INTO support.LodiProvinceIstatCodes VALUES(98018, 'Cervignano d''Adda');
INSERT INTO support.LodiProvinceIstatCodes VALUES(98019, 'Codogno');
INSERT INTO support.LodiProvinceIstatCodes VALUES(98020, 'Comazzo');
INSERT INTO support.LodiProvinceIstatCodes VALUES(98021, 'Cornegliano Laudense');
INSERT INTO support.LodiProvinceIstatCodes VALUES(98022, 'Corno Giovine');
INSERT INTO support.LodiProvinceIstatCodes VALUES(98023, 'Cornovecchio');
INSERT INTO support.LodiProvinceIstatCodes VALUES(98024, 'Corte Palasio');
INSERT INTO support.LodiProvinceIstatCodes VALUES(98025, 'Crespiatica');
INSERT INTO support.LodiProvinceIstatCodes VALUES(98026, 'Fombio');
INSERT INTO support.LodiProvinceIstatCodes VALUES(98027, 'Galgagnano');
INSERT INTO support.LodiProvinceIstatCodes VALUES(98028, 'Graffignana');
INSERT INTO support.LodiProvinceIstatCodes VALUES(98029, 'Guardamiglio');
INSERT INTO support.LodiProvinceIstatCodes VALUES(98030, 'Livraga');
INSERT INTO support.LodiProvinceIstatCodes VALUES(98031, 'Lodi');
INSERT INTO support.LodiProvinceIstatCodes VALUES(98032, 'Lodi Vecchio');
INSERT INTO support.LodiProvinceIstatCodes VALUES(98033, 'Maccastorna');
INSERT INTO support.LodiProvinceIstatCodes VALUES(98034, 'Mairago');
INSERT INTO support.LodiProvinceIstatCodes VALUES(98035, 'Maleo');
INSERT INTO support.LodiProvinceIstatCodes VALUES(98036, 'Marudo');
INSERT INTO support.LodiProvinceIstatCodes VALUES(98037, 'Massalengo');
INSERT INTO support.LodiProvinceIstatCodes VALUES(98038, 'Meleti');
INSERT INTO support.LodiProvinceIstatCodes VALUES(98039, 'Merlino');
INSERT INTO support.LodiProvinceIstatCodes VALUES(98040, 'Montanaso Lombardo');
INSERT INTO support.LodiProvinceIstatCodes VALUES(98041, 'Mulazzano');
INSERT INTO support.LodiProvinceIstatCodes VALUES(98042, 'Orio Litta');
INSERT INTO support.LodiProvinceIstatCodes VALUES(98043, 'Ospedaletto Lodigiano');
INSERT INTO support.LodiProvinceIstatCodes VALUES(98044, 'Ossago Lodigiano');
INSERT INTO support.LodiProvinceIstatCodes VALUES(98045, 'Pieve Fissiraga');
INSERT INTO support.LodiProvinceIstatCodes VALUES(98046, 'Salerano sul Lambro');
INSERT INTO support.LodiProvinceIstatCodes VALUES(98047, 'San Fiorano');
INSERT INTO support.LodiProvinceIstatCodes VALUES(98048, 'San Martino in Strada');
INSERT INTO support.LodiProvinceIstatCodes VALUES(98049, 'San Rocco al Porto');
INSERT INTO support.LodiProvinceIstatCodes VALUES(98050, 'Sant''Angelo Lodigiano');
INSERT INTO support.LodiProvinceIstatCodes VALUES(98051, 'Santo Stefano Lodigiano');
INSERT INTO support.LodiProvinceIstatCodes VALUES(98052, 'Secugnago');
INSERT INTO support.LodiProvinceIstatCodes VALUES(98053, 'Senna Lodigiana');
INSERT INTO support.LodiProvinceIstatCodes VALUES(98054, 'Somaglia');
INSERT INTO support.LodiProvinceIstatCodes VALUES(98055, 'Sordio');
INSERT INTO support.LodiProvinceIstatCodes VALUES(98056, 'Tavazzano con Villavesco');
INSERT INTO support.LodiProvinceIstatCodes VALUES(98057, 'Terranova dei Passerini');
INSERT INTO support.LodiProvinceIstatCodes VALUES(98058, 'Turano Lodigiano');
INSERT INTO support.LodiProvinceIstatCodes VALUES(98059, 'Valera Fratta');
INSERT INTO support.LodiProvinceIstatCodes VALUES(98060, 'Villanova del Sillaro');
INSERT INTO support.LodiProvinceIstatCodes VALUES(98061, 'Zelo Buon Persico');

------------------
-- END REQUIRED --
------------------




----------------------------
-- BEGIN TYPES DEFINITION --
----------------------------

DROP TYPE IF EXISTS support.Resume_t CASCADE;
-- This is used to store basic information about a contract
CREATE TYPE support.Resume_t AS (
	contractID int8,
	customerID int8,
	name text,
	surname text,
	SSN text,
	countryCode text,
	prefix text,
	coreNumber text,
	stipulatedOn timestamp,
	numOperations int
);




DROP TYPE IF EXISTS support.Resume_Extended_t CASCADE;
-- This is used to store extended information about a contract. The first attributes are identical to those defined for 'Resume_t' type.
CREATE TYPE support.Resume_Extended_t AS (
	contractID int8,
	customerID int8,
	name text,
	surname text,
	SSN text,
	countryCode text,
	prefix text,
	coreNumber text,
	stipulatedOn date,
	numOperations int,
	
	hadFreePromotion boolean,
	promotionExpirationDate timestamp,
	SMSsLeft int,
	secondsLeft int,
	KBsLeft int,
	balance numeric,
	wantsBill boolean,
	hadDiscount boolean,
	accountBalance numeric,
	IBAN text
);




DROP TYPE IF EXISTS support.TelephoneNumber_t CASCADE;

CREATE TYPE support.TelephoneNumber_t AS (
	countryCode text,
	prefix text,
	coreNumber text
);




DROP TYPE IF EXISTS support.Address_t CASCADE;
 
CREATE TYPE support.Address_t AS (
	state support.States_d,
	city text,
	streetName text,
	streetNumber int,
	ZIP text
);

--------------------------
-- END TYPES DEFINITION --
--------------------------




------------------------
-- BEGIN CORE SECTION --
------------------------

DROP TABLE IF EXISTS freefall.Address CASCADE;

CREATE TABLE freefall.Address (
	address_ID serial PRIMARY KEY,
	state support.States_d NOT NULL,
	city text NOT NULL
);




DROP TABLE IF EXISTS freefall.ItalianAddress CASCADE;

CREATE TABLE freefall.ItalianAddress (
	streetName text NOT NULL,
	streetNumber int CHECK (streetNumber > 0) NOT NULL,
	ZIP text NOT NULL -- Not treated as a DOMAIN since ZIP codes change frequently. When the development started, italian districts reorganization was in place
) INHERITS(freefall.Address);




DROP TABLE IF EXISTS freefall.BankAccount CASCADE;

CREATE TABLE freefall.BankAccount (
	bankAccount_ID serial PRIMARY KEY,
	accountBalance numeric(9,2) NOT NULL
);




DROP TABLE IF EXISTS freefall.ItalianIBAN CASCADE;

CREATE TABLE freefall.ItalianIBAN (
	italianIBAN_ID serial PRIMARY KEY,
	stateCode support.StateCodes_d DEFAULT 'IT',
	controlCode char(2),
	CINCode char(1),
	ABICode char(5),
	CABCode char(5),
	accountNumber char(12),

	UNIQUE(stateCode, controlCode, CINCode, ABICode, CABCode, accountNumber)
);




DROP TABLE IF EXISTS freefall.ItalianBankAccount CASCADE;

CREATE TABLE freefall.ItalianBankAccount (
	italianIBAN_REF int UNIQUE REFERENCES freefall.ItalianIBAN ON DELETE CASCADE,
	currencyCode support.CurrencyCodes_d DEFAULT 'EUR',
	italianBankAccount_ID serial PRIMARY KEY
) INHERITS(freefall.BankAccount);




DROP TABLE IF EXISTS freefall.SpecialOffer CASCADE;
-- Here we define the items which customers can buy at a discounted price from the Freefall Store
CREATE TABLE freefall.SpecialOffer (
	offer_ID serial PRIMARY KEY,
	createdOn timestamp NOT NULL,
	originalPrice numeric(6,2) NOT NULL,
	discountedPrice numeric(6,2) NOT NULL CHECK(discountedPrice < originalPrice * .95), -- Discount amount must be at least 5% of 'originalPrice'
	description text
);




DROP TABLE IF EXISTS freefall.Customer CASCADE;
-- Here, the combination of UNIQUE constraints between (SSN) and (name, surname) models the fact that, for example,
-- SSN: LMNNCL87.. pertains only to Nicola Lamonaca. Since we have chosen not to model the customer's gender or his birth date,
-- if we don't define the UNIQUE constraint on (name, surname) we could have a second row for Nicola Lamonaca maybe with a different SSN
-- and this would lead to confusion. Of course, if we ask for the gender and the birth date, we can drop the UNIQUE constraint on (name, surname)
CREATE TABLE freefall.Customer (
	customer_ID serial PRIMARY KEY,
	SSN varchar(16) UNIQUE,
	name text NOT NULL,
	surname text NOT NULL,
	address support.Address_t, -- We insert addresses into the 'ItalianAddress' table as soon as a new 'Customer' is created
	altTelephoneNumbers support.TelephoneNumber_t[], -- We insert TelephoneNumbers into the rigth table ('CellPhoneNumber' or 'HomePhoneNumber') as soon as a new 'Customer' is created
	specialOffers_REF int[] DEFAULT NULL,
	
	UNIQUE(name, surname)
);




DROP FUNCTION IF EXISTS freefall.create_new_address_FNC() CASCADE;
-- FUNCTION: create_new_address_FNC()
---- DESCRIPTION: creates a new address as soon as a new 'Customer' is created and puts it into the 'ItalianAddress' table
---- in: none
---- out: none
---- USAGE: "INSERT INTO freefall.Customer VALUES (DEFAULT, 'WTRBSP60M23D643C', 'Walter', 'Bishop', ('Italy', 'Lodi', 'Via XX Settembre', 12, 26900), ARRAY[1]);"
---- OUTPUT: none
CREATE FUNCTION freefall.create_new_address_FNC() RETURNS TRIGGER AS
$$
	BEGIN
		INSERT INTO freefall.ItalianAddress VALUES (
			DEFAULT,
			(NEW.address).state,
			(NEW.address).city,
			(NEW.address).streetName,
			(NEW.address).streetNumber,
			(NEW.address).ZIP
		);

		RETURN NULL;
	END;
$$
LANGUAGE 'plpgsql';

CREATE TRIGGER create_new_address_TRG
AFTER INSERT ON freefall.Customer
FOR EACH ROW
EXECUTE PROCEDURE freefall.create_new_address_FNC();




DROP FUNCTION IF EXISTS is_town_prefix_FNC(text);
-- FUNCTION: is_town_prefix_FNC(text)
---- DESCRIPTION: checks whether the specified prefix is a town prefix, in which case TRUE is returned, otherwise FALSE by handling an exception trown
----              when the CAST() cannot be performed. Used in 'check_destination_number_FNC()' function
---- in: prefix = the prefix to be checked
---- out: none
---- USAGE:  "is_town_prefix_FNC(source.prefix)"
---- OUTPUT: TRUE OR FALSE
CREATE FUNCTION is_town_prefix_FNC(prefix text) RETURNS BOOLEAN AS
$$
	DECLARE result boolean := TRUE;
	DECLARE aValue support.TownPrefixes_d;

	BEGIN
		
		SELECT CAST(prefix AS support.TownPrefixes_d) INTO aValue;

		RETURN result;
		
		EXCEPTION WHEN check_violation THEN
 			result := FALSE;

 		RETURN result;
	END;
$$
LANGUAGE 'plpgsql';




DROP FUNCTION IF EXISTS is_operator_prefix_FNC(text);
-- FUNCTION: is_operator_prefix_FNC(text)
---- DESCRIPTION: checks whether the specified prefix is an operator prefix, in which case TRUE is returned, otherwise FALSE by handling an exception trown
----              when the CAST() cannot be performed. Used in 'register_customers_telephone_numbers_FNC' function
---- in: prefix = the prefix to be checked
---- out: none
---- USAGE:  "is_operator_prefix_FNC(source.prefix)"
---- OUTPUT: TRUE OR FALSE
CREATE FUNCTION is_operator_prefix_FNC(prefix text) RETURNS BOOLEAN AS
$$
	DECLARE result boolean := TRUE;
	DECLARE aValue support.OperatorPrefixes_d;

	BEGIN
		
		SELECT CAST(prefix AS support.OperatorPrefixes_d) INTO aValue;

		RETURN result;
		
		EXCEPTION WHEN check_violation THEN
			result := FALSE;

 		RETURN result;
	END;
$$
LANGUAGE 'plpgsql';




DROP FUNCTION IF EXISTS freefall.register_customer_alternative_telephone_numbers_FNC() CASCADE;
-- FUNCTION: register_customer_alternative_telephone_numbers_FNC()
---- DESCRIPTION: checks whether the REFs to 'TelephoneNumber' are actually valid, in which case the operation is completed, 
----              otherwise an exception is raised and the operation aborted
---- in: none
---- out: none
---- USAGE: "INSERT INTO freefall.Customer VALUES (DEFAULT, 'WTRBSP60M23D643C', 'Walter', 'Bishop', ('Italy', 'Lodi', 'Via XX Settembre', 12, 26900), );"
---- OUTPUT: "ERROR: Provided phone number(s) not valid!" OR the new row
CREATE FUNCTION freefall.register_customer_alternative_telephone_numbers_FNC() RETURNS TRIGGER AS
$$
	DECLARE newTelephoneNumber support.TelephoneNumber_t;
	DECLARE i int := 1;

  	BEGIN
		-- Here we secretly check that REFs to special offers are valid, otherwise we raise an exception.
		-- We are forced to do this check in this trigger because otherwise this trigger would register customer's alternative
		-- telephone numbers both if REFs are actually valid or not. In this way, instead, we do this only if REFs are valid
		IF(NEW.SpecialOffers_REF IS NOT NULL) THEN
			-- For each element in the specialOffers_REF array
			FOR i IN 1 .. ARRAY_LENGTH(NEW.SpecialOffers_REF, 1) LOOP
				-- If the i-th special offer specified does not exist in the 'SpecialOffer' table raise an exception
				IF((SELECT offer_ID FROM freefall.SpecialOffer WHERE offer_ID = NEW.SpecialOffers_REF[i]) IS NULL) THEN
					RAISE NOTICE '-----------------------------------------------------';
					RAISE EXCEPTION 'One or more specified Special Offers do(es) not exist!';
					RETURN NULL;
				END IF;
			END LOOP;
		END IF;
		
		-- If array is empty it's OK: the new customer has no alternative telephone numbers. Insert the new 'Customer' into the table.
		IF(ARRAY_UPPER(NEW.altTelephoneNumbers, 1) IS NULL) THEN
			RETURN NEW;
		ELSE
			-- For each telephone number in the new array
			WHILE i <= ARRAY_UPPER(NEW.altTelephoneNumbers, 1) LOOP
				newTelephoneNumber := NEW.altTelephoneNumbers[i];

				-- If it's a 'CellPhoneNumber'
				IF(is_operator_prefix_FNC(newTelephoneNumber.prefix)) THEN
 					-- If no exception is raised, then we have a mobile-phone number: insert a new number into 'CellPhoneNumber' table
					INSERT INTO freefall.CellPhoneNumber VALUES(DEFAULT, newTelephoneNumber.countryCode, newTelephoneNumber.prefix::support.OperatorPrefixes_d, newTelephoneNumber.coreNumber, DEFAULT);

					i := i + 1;
 				-- Otherwise, if an exception is raised, we have a home-phone number: insert a new number into 'HomePhoneNumber' table
 				ELSIF(NOT(is_operator_prefix_FNC(newTelephoneNumber.prefix))) THEN
 					INSERT INTO freefall.HomePhoneNumber VALUES(DEFAULT, newTelephoneNumber.countryCode, newTelephoneNumber.prefix::support.TownPrefixes_d, newTelephoneNumber.coreNumber, DEFAULT);

					i := i + 1;
				ELSE
					RAISE NOTICE '------------------------------------------------------------------';
					RAISE EXCEPTION 'New customer''s telephone number is not valid. Please check again.';
				END IF;
			END LOOP;

			RETURN NEW;
		END IF;
	END
$$
LANGUAGE plpgsql;

CREATE TRIGGER register_customer_alternative_telephone_numbers_TRG
BEFORE INSERT ON freefall.Customer
FOR EACH ROW
EXECUTE PROCEDURE freefall.register_customer_alternative_telephone_numbers_FNC();




DROP TABLE IF EXISTS freefall.OrdinaryPlan CASCADE;

CREATE TABLE freefall.OrdinaryPlan (
	ordinaryPlan_ID serial PRIMARY KEY,
	planType support.PlanTypes_d NOT NULL,
	callPrice numeric(4,2) NOT NULL,
	videoCallPrice numeric(4,2) NOT NULL,
	SMSPrice numeric(4,2) NOT NULL,
	MMSPrice numeric(4,2) NOT NULL,
	internationalCallPrice numeric(4,2) NOT NULL,
	internationalMessageMultFactor numeric(2,1) NOT NULL CHECK(internationalMessageMultFactor > 1 AND internationalMessageMultFactor < 2) -- From 1.1 to 1.9
);




DROP TABLE IF EXISTS freefall.PayMonthlyPricePlan CASCADE;

CREATE TABLE freefall.PayMonthlyPricePlan (
	bankDetails_REF int REFERENCES freefall.ItalianBankAccount ON DELETE CASCADE,
	hadDiscount boolean NOT NULL DEFAULT FALSE,
	payMonthlyPricePlan_ID serial PRIMARY KEY
) INHERITS(freefall.OrdinaryPlan);




DROP TABLE IF EXISTS freefall.PayAndGoPricePlan CASCADE;

CREATE TABLE freefall.PayAndGoPricePlan (
	balance numeric(5,2),
	wantsBill boolean NOT NULL DEFAULT FALSE,
	payAndGoPricePlan_ID serial PRIMARY KEY
) INHERITS(freefall.OrdinaryPlan);




DROP TABLE IF EXISTS freefall.TemporaryPromotion CASCADE;

CREATE TABLE freefall.TemporaryPromotion (
	promotion_ID serial PRIMARY KEY,
	validUntil timestamp NOT NULL,
	freeSMSsLeft int NOT NULL,
	freeSecondsLeft int NOT NULL,
	FreeKBsLeft int NOT NULL,
	favoriteNumber_REF int REFERENCES freefall.FreefallCellPhoneNumber ON UPDATE CASCADE --'TemporaryPromotion's are valid only on freefall cellphone numbers already assigned, thus towards those who are already customers
);




DROP TABLE IF EXISTS freefall.Contract CASCADE;

CREATE TABLE freefall.Contract (
	contract_ID serial PRIMARY KEY,
	customer_REF int REFERENCES freefall.Customer ON DELETE CASCADE NOT NULL,
	ordinaryPlan_REF int UNIQUE NOT NULL,
	cellPhoneNumber_REF int REFERENCES freefall.FreefallCellPhoneNumber UNIQUE DEFAULT NULL, -- It can be NULL meaning a contract is temporarily not active
	stipulatedOn timestamp NOT NULL,
	activePromotion_REF int REFERENCES freefall.TemporaryPromotion DEFAULT NULL,
	hadFreePromotion boolean NOT NULL DEFAULT FALSE
);




DROP FUNCTION IF EXISTS freefall.check_before_update_on_temporary_promotion_table_FNC() CASCADE;
-- FUNCTION: check_before_update_on_temporary_promotion_table_FNC()
---- DESCRIPTION: checks whether the reference to the favorite number is valid, that is whether it has been assigned
---- in: none
---- out: none
---- USAGE:  "UPDATE freefall.TemporaryPromotion SET favoriteNumber_REF = 1 WHERE promotion_ID = 1;"
CREATE FUNCTION freefall.check_before_update_on_temporary_promotion_table_FNC() RETURNS TRIGGER AS
$$
	BEGIN
	
		IF((SELECT assigned FROM freefall.FreefallCellPhoneNumber WHERE freefallNumber_ID = NEW.favoriteNumber_REF) = TRUE) THEN
			RETURN NEW;
		ELSE
			RAISE EXCEPTION 'Provided favorite number is not valid. Can''t insert new temporary promotion';
			RETURN NULL;
		END IF;
	END;
$$
LANGUAGE 'plpgsql';

CREATE TRIGGER check_before_update_on_temporary_promotion_table_TRG
BEFORE UPDATE OF favoriteNumber_REF ON freefall.TemporaryPromotion
FOR EACH ROW
EXECUTE PROCEDURE freefall.check_before_update_on_temporary_promotion_table_FNC();




DROP FUNCTION IF EXISTS freefall.assign_new_cellphone_number_to_contract_FNC() CASCADE;
-- FUNCTION: assign_new_cellphone_number_to_contract_FNC()
---- DESCRIPTION: scans the 'FreefallCellPhoneNumber' table and finds the first row which 'assigned' field is FALSE, then sets it to TRUE and assigns this number to the new contract
---- in: none
---- out: none
---- USAGE:  "INSERT INTO freefall.Contract VALUES(DEFAULT, 2, 2, NULL, 'now',    2, FALSE);";
CREATE FUNCTION freefall.assign_new_cellphone_number_to_contract_FNC() RETURNS TRIGGER AS
$$
	DECLARE newCellPhoneNumber freefall.FreefallCellPhoneNumber;
	DECLARE minID int;

	BEGIN
		-- We select the first cellphone number which has still not been assigned
		SELECT MIN(freefallNumber_ID) INTO minID FROM freefall.FreefallCellPhoneNumber WHERE assigned = FALSE;

		-- We set the selected number as assigned
		UPDATE freefall.FreefallCellPhoneNumber SET assigned = TRUE WHERE freefallNumber_ID = minID;

		-- Retrieve the just-assigned cellphone number
		SELECT * INTO newCellPhoneNumber FROM freefall.FreefallCellPhoneNumber WHERE freefallNumber_ID = minID;

		-- Insert the newly-assigned cellphone number into the 'CellPhoneNumber' table
		INSERT INTO freefall.CellPhoneNumber VALUES(DEFAULT, newCellPhoneNumber.countryCode, newCellPhoneNumber.freefallPrefix::support.OperatorPrefixes_d, newCellPhoneNumber.coreNumber, DEFAULT);
		
 		-- Set the reference to the telephone number of the 'Contract' table to the ID of the newly-inserted cellphone number
 		UPDATE freefall.Contract SET cellPhoneNumber_REF = minID WHERE contract_ID = NEW.contract_ID;

 		RETURN NEW;
 	END;
$$
LANGUAGE 'plpgsql';
 
CREATE TRIGGER assign_new_cellphone_number_to_contract_TRG
AFTER INSERT ON freefall.Contract
FOR EACH ROW
EXECUTE PROCEDURE freefall.assign_new_cellphone_number_to_contract_FNC();




DROP FUNCTION IF EXISTS freefall.manage_plan_and_promotion_FNC() CASCADE;
-- FUNCTION: manage_plan_and_promotion_FNC()
---- DESCRIPTION: implements composition between 'Contract' and 'OrdinaryPlan' tables and between 'Contract' and 'TemporaryPromotion' tables
---- in: none
---- out: none
---- USAGE:  "DELETE FROM freefall.Contract WHERE contract_ID = 1";
CREATE FUNCTION freefall.manage_plan_and_promotion_FNC() RETURNS TRIGGER AS
$$
	BEGIN
		DELETE FROM freefall.OrdinaryPlan WHERE ordinaryPlan_ID = OLD.ordinaryPlan_REF;
	
		DELETE FROM freefall.TemporaryPromotion WHERE promotion_ID = OLD.activePromotion_REF;

		RETURN NULL;
	END
$$
LANGUAGE 'plpgsql';

CREATE TRIGGER manage_plan_and_promotion_TRG
AFTER DELETE ON freefall.Contract
FOR EACH ROW
EXECUTE PROCEDURE freefall.manage_plan_and_promotion_FNC();




DROP FUNCTION IF EXISTS is_promotion_still_valid_FNC(promotionID int) CASCADE;
-- FUNCTION: is_promotion_still_valid_FNC(int)
---- DESCRIPTION: checks whether a promotion is still valid.
---- in: promotionID = the ID of the promotion
---- out: TRUE OR FALSE
---- USAGE:  "SELECT is_promotion_still_valid_FNC(promotion)";
CREATE FUNCTION is_promotion_still_valid_FNC(promotionID int) RETURNS BOOLEAN AS
$$
	DECLARE promotion int;
	DECLARE dateValidUntil timestamp;
	DECLARE SMSsLeft int;
	DECLARE secondsLeft int;
	DECLARE KBsLeft int;
	DECLARE favoriteNumberREF int;

	BEGIN
		SELECT promotion_ID, validUntil, freeSMSsLeft, freeSecondsLeft, freeKBsLeft, favoriteNumber_REF INTO promotion, dateValidUntil, SMSsLeft, secondsLeft, KBsLeft, favoriteNumberREF FROM freefall.TemporaryPromotion WHERE promotion_ID = promotionID;
		
		IF((promotion IS NULL) OR (SMSsLeft = 0 AND secondsLeft = 0 AND KBsLeft = 0) OR ((SELECT CURRENT_TIMESTAMP) > dateValidUntil) OR (favoriteNumberREF IS NULL)) THEN
			RETURN FALSE;
		END IF;

		RETURN TRUE;
	END;
$$
LANGUAGE plpgsql;




DROP TABLE IF EXISTS freefall.Operation CASCADE;
-- 'operationCost' is NULL during INSERTs, but it is later dinamically calculated by 'make_call_FNC()' and 'send_message_FNC()'
-- functions based on the actual duration of the operation and the cost of the operation specified in the associated 'TemporaryPromotion'.
CREATE TABLE freefall.Operation (
	operation_ID serial PRIMARY KEY,
	contract_REF int CHECK(contract_REF > 0) REFERENCES freefall.Contract NOT NULL,
	performedOn timestamp NOT NULL,
	receiverPhoneNumber support.TelephoneNumber_t NOT NULL, -- We do not need to declare 'receiverPhoneNumber' to be of type 'TelephoneNumber', because we don't need the receiver phone to be in the 'TelephoneNumber' table; we only need to be sure it is a well-formed telephone number
	isVideo boolean NOT NULL DEFAULT FALSE,
	isInternational boolean NOT NULL,
	operationCost numeric(4,2)
);




DROP TABLE IF EXISTS freefall.Call CASCADE;

CREATE TABLE freefall.Call (
	durationInSeconds int NOT NULL,
	call_ID serial PRIMARY KEY
) INHERITS(freefall.Operation);




DROP TABLE IF EXISTS freefall.Message CASCADE;

CREATE TABLE freefall.Message (
	transmittedKBs int NOT NULL,
	message_ID serial PRIMARY KEY
) INHERITS(freefall.Operation);




DROP TABLE IF EXISTS freefall.Bill CASCADE;
-- Here we store the bills for 'PayMonthlyPricePlan' customers and for 'PayAndGoPricePlans' customers who request bills
CREATE TABLE freefall.Bill (
	bill_ID serial PRIMARY KEY,
	contract_REF int NOT NULL REFERENCES freefall.Contract ON DELETE CASCADE,                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
	emittedOn timestamp NOT NULL,
	totalAmount numeric(5,2) DEFAULT NULL -- Negative values admitted. If totalAmount < 0, then the customer has a credit rather than a debt
);




DROP TABLE IF EXISTS freefall.BillDetail CASCADE;
-- Here we put the details of the operations for each bill
CREATE TABLE freefall.BillDetail (
	detail_ID serial PRIMARY KEY,
	bill_REF int REFERENCES freefall.Bill ON DELETE CASCADE,
	operation_REF int UNIQUE,
	operationType text NOT NULL,
	performedOn timestamp NOT NULL,
	receiverPhoneNumber support.TelephoneNumber_t NOT NULL,
	durationInSeconds int,
	transmittedKBs int,
	operationCost numeric
);




DROP TABLE IF EXISTS freefall.Error CASCADE;

CREATE TABLE freefall.Error (
	error_ID serial PRIMARY KEY,
	bill_REF int REFERENCES freefall.Bill ON DELETE CASCADE NOT NULL,
	registeredOn timestamp NOT NULL,
	description text NOT NULL,
	fixed boolean NOT NULL DEFAULT FALSE
);




DROP FUNCTION IF EXISTS register_error_FNC(int, text) CASCADE;
-- FUNCTION: register_error_FNC(int, text)
---- DESCRIPTION: associates a new error to an existing bill.
---- in: billID = the ID of the bill which the error refers to
---- in: description = the description of the error
---- out: none
---- USAGE:  "SELECT register_error_FNC(1, 'Customer complains that the address on his bill is not up to date.')";
---- OUTPUT: none
CREATE FUNCTION register_error_FNC(billID int, description text)  RETURNS VOID AS
$$
	DECLARE ID int;
	
	BEGIN
		IF((SELECT bill_ID FROM freefall.Bill WHERE bill_ID = billID) IS NOT NULL) THEN
			-- There's no need to check whether the bill actually exists, as we have defined a FK constraint on the 'bill_REF' column in the 'Bill' table
			INSERT INTO freefall.Error VALUES(DEFAULT, billID, 'now', description, FALSE);

			SELECT MAX(error_ID) FROM freefall.Error INTO ID;

			RAISE NOTICE '';
			RAISE NOTICE '---------------------------------------';
			RAISE NOTICE 'error_ID = % registered to bill_ID = %.', ID, billID;
			RAISE NOTICE 'DESCRIPTION: ''%''', description;
			RAISE NOTICE '---------------------------------------';
		ELSE
			RAISE NOTICE '';
			RAISE NOTICE '--------------------------------------------';
			RAISE NOTICE 'bill_ID = % not found. Can''t register error.', billID;
			RAISE NOTICE '--------------------------------------------';

			RETURN;
		END IF;
	END
$$
LANGUAGE 'plpgsql';




DROP FUNCTION IF EXISTS unregister_error_FNC(errorID int) CASCADE;
-- FUNCTION: unregister_error_FNC(errorID int)
---- DESCRIPTION: sets an error regarding a given bill as fixed, while always keeping it in the database.
----              We can think of a mechanism which periodically (i.e. each 30 days) collects all fixed errors and storicize them in a proper table.
----              NOTE: this does not remove the error from the 'Error' table, but only sets the 'fixed' attribute to TRUE.
----                    Future developments may include a mechanism by which from time to time all fixed errors are moved into a separate table.
---- in: errorID = the ID of the error to be modified
---- out: none
---- USAGE:  "SELECT unregister_error_FNC(1)";
---- OUTPUT: none
CREATE FUNCTION unregister_error_FNC(errorID int)  RETURNS VOID AS
$$
	DECLARE ID int;
	DECLARE bill int;
	
	BEGIN
		IF((SELECT error_ID FROM freefall.Error WHERE error_ID = errorID) IS NOT NULL) THEN
			UPDATE freefall.Error SET fixed = TRUE WHERE error_ID = errorID;

			SELECT bill_REF INTO bill FROM freefall.Error WHERE error_ID = errorID;

			RAISE NOTICE '';
			RAISE NOTICE '-------------------------------------------';
			RAISE NOTICE 'error_ID = % unregistered from bill_ID = %.', errorID, bill;
			RAISE NOTICE '-------------------------------------------';
		ELSE
			RAISE NOTICE '';
			RAISE NOTICE '-----------------------------------------------';
			RAISE NOTICE 'error_ID = % not found. Can''t unregister error.', errorID;
			RAISE NOTICE '-----------------------------------------------';

			RETURN;
		END IF;
	END
$$
LANGUAGE 'plpgsql';




DROP FUNCTION IF EXISTS generate_bill_FNC(int, timestamp) CASCADE;
-- FUNCTION: generate_bill_FNC(contractREF int, operationDate timestamp)
---- DESCRIPTION: generates a new bill.
----		  The tables 'Call' and 'Message' are scanned and operations performed in the month preceding that of 'operationDate'
----              and pertaining to the same 'contractREF' are included in the new bill.
----		  The bill total is then computed by summing the total amounts of all the included operations.
---- in: contractREF = the ID of the contract the bill must be created for
---- in: operationDate = the NEW operation's timestamp against which operations must be compared to determine which of them are to be included in the new bill 
---- out: details = an array containing the operations included in the bill
---- USAGE:  "SELECT generate_bill_FNC(contractREF, NEW.performedOn) INTO details;";
---- OUTPUT: none
CREATE FUNCTION generate_bill_FNC(contractREF int, operationDate timestamp) RETURNS freefall.BillDetail[] AS
$$
	DECLARE callIDs int[];
	DECLARE messageIDs int[];
	DECLARE billID int;

	DECLARE performed timestamp;
	DECLARE receiverNumber support.TelephoneNumber_t;
	DECLARE newDetail freefall.BillDetail;
	DECLARE operationID int;
	DECLARE duration int;
	DECLARE transmitted int;
	DECLARE opCost numeric;
	DECLARE amount numeric;
	DECLARE x int;
	DECLARE y int;
	DECLARE details freefall.BillDetail[] := NULL;

	BEGIN
		-- Create a new bill
		INSERT INTO freefall.Bill VALUES(DEFAULT, contractREF, 'now', NULL);

		-- Get the ID of the newly created bill
		SELECT MAX(bill_ID) INTO billID FROM freefall.Bill;

		-- Retrieve calls IDs - We put into the array only those calls which month is equal to te current call's month minus 1,
		-- that's to say only those calls performed in the month preceding the month of the call being performed now
		SELECT ARRAY_AGG(call_ID) INTO callIDs FROM freefall.Call WHERE contract_REF = contractREF AND EXTRACT(MONTH FROM performedOn) = EXTRACT(MONTH FROM operationDate) - 1;

		-- Retrieve messages IDs - We put into the array only those messages which month is equal to te current message's month minus 1,
		-- that's to say only those messages performed in the month preceding the month of the message being sent now
		SELECT ARRAY_AGG(message_ID) INTO messageIDs FROM freefall.Message WHERE contract_REF = contractREF AND EXTRACT(MONTH FROM performedOn) = EXTRACT(MONTH FROM operationDate) - 1;
		
		IF(callIDs IS NOT NULL) THEN
			FOREACH x IN ARRAY callIDs LOOP
				SELECT operation_ID INTO operationID FROM freefall.Call WHERE call_ID = x;
				SELECT performedOn INTO performed FROM freefall.Call WHERE call_ID = x;
				SELECT receiverPhoneNumber INTO receiverNumber FROM freefall.Call WHERE call_ID = x;
				SELECT durationInSeconds INTO duration FROM freefall.Call WHERE call_ID = x;
				SELECT operationCost INTO opCost FROM freefall.Call WHERE call_ID = x;

				INSERT INTO freefall.BillDetail VALUES(DEFAULT, billID, operationID, 'Call', performed, receiverNumber, duration, NULL, opCost);

				SELECT * INTO newDetail FROM freefall.BillDetail WHERE detail_ID = (SELECT MAX(detail_ID) FROM freefall.BillDetail);
				SELECT ARRAY_APPEND(details, newDetail) INTO details;
			END LOOP;
		END IF;
	 
		IF(messageIDs IS NOT NULL) THEN
			FOREACH y IN ARRAY messageIDs LOOP
				SELECT operation_ID INTO operationID FROM freefall.Message WHERE message_ID = y;
				SELECT performedOn INTO performed FROM freefall.Message WHERE message_ID = y;
				SELECT receiverPhoneNumber INTO receiverNumber FROM freefall.Message WHERE message_ID = y;
				SELECT transmittedKBs INTO transmitted FROM freefall.Message WHERE message_ID = y;
				SELECT operationCost INTO opCost FROM freefall.Message WHERE message_ID = y;

				INSERT INTO freefall.BillDetail VALUES(DEFAULT, billID, operationID, 'Message', performed, receiverNumber, NULL, transmitted, opCost);

				SELECT * INTO newDetail FROM freefall.BillDetail WHERE detail_ID = (SELECT MAX(detail_ID) FROM freefall.BillDetail);
				SELECT ARRAY_APPEND(details, newDetail) INTO details;
			END LOOP;
		END IF;

		SELECT SUM(operationCost) INTO amount FROM freefall.BillDetail WHERE bill_REF = billID;
		UPDATE freefall.Bill SET totalAmount = amount WHERE bill_ID = billID;
		
		RETURN details;
	END;
$$
LANGUAGE 'plpgsql';



----------------------------------------------------------------------------------------------------------------------------------
-- Activity #4.2: Keep the bill associated to a 'PayMonthlyPricePlan' up-to-date as new operations are performed.               --
----------------------------------------------------------------------------------------------------------------------------------
DROP FUNCTION IF EXISTS freefall.check_if_bill_must_be_generated_FNC() CASCADE;
-- FUNCTION: check_if_bill_must_be_generated_FNC()
---- DESCRIPTION: performs checks in order to determine when a bill must be generated. We generate a new bill whenever the new operation's month is greater than those stored
----              into the 'Operation' table for a given contract. We then check if a discount can be applied.
---- in: contractREF = the ID of the contract the bill must be created for
---- in: operationDate = the NEW operation's timestamp against which operations must be compared to determine which of them are to be included in the new bill 
---- out: details = an array containing the operations included in the bill
---- USAGE:  "SELECT generate_bill_FNC(contractREF, NEW.performedOn) INTO details;";
---- OUTPUT: none
CREATE FUNCTION freefall.check_if_bill_must_be_generated_FNC() RETURNS TRIGGER AS
$$
	DECLARE maxID int;
	DECLARE contractREF int;
	DECLARE previousOperationTimestamp timestamp;
	DECLARE previousOperationDate timestamp;
	DECLARE plan int;
	DECLARE requestsBill boolean;
	DECLARE pType support.PlanTypes_d;
	DECLARE details freefall.BillDetail[];
	DECLARE x freefall.BillDetail;

	DECLARE startDate date := '2012-04-20 00:00:00';
	DECLARE endDate date := '2012-05-20 23:59:59';
	DECLARE discountAmount numeric(4,2) := 50; -- Specifications tell this amount must be 50 €, but since it is too high for our automatically generated total amounts we set it to 10 €. 
	DECLARE discountThreshold numeric(5,2) := 150;
	DECLARE operationsTotalAmount numeric;
	DECLARE alreadyHadDiscount boolean;
	DECLARE maxBillID int;
	DECLARE newBillTotalAmount numeric;

	BEGIN
		-- Get the last operation made in the month preceding the new operation's month
		SELECT MAX(operation_ID) INTO maxID FROM freefall.Operation WHERE contract_REF = NEW.contract_REF AND performedOn < NEW.performedOn;
		
		-- If at least 1 operation has been performed
		IF(maxID IS NOT NULL) THEN
			-- Let's determine the contract and the price plan
			SELECT contract_REF INTO contractREF FROM freefall.Operation WHERE contract_REF = NEW.contract_REF;

			-- Get the date of the most recent operation performed
			SELECT MAX(performedOn) INTO previousOperationTimestamp FROM freefall.Operation WHERE operation_ID = maxID;

			-- If this operation has been performed in the month preceding that of the new operation being inserted
			IF(EXTRACT(MONTH FROM previousOperationTimestamp) < EXTRACT(MONTH FROM NEW.performedOn) AND NEW.contract_REF = contractREF) THEN -- CONTROLLARE CONDIZIONE
				-- Get the customer's plan
				SELECT ordinaryPlan_REF INTO plan FROM freefall.Contract WHERE contract_ID = contractREF;

				--RAISE NOTICE 'previousOperationTimestamp = %', previousOperationTimestamp;
				--RAISE NOTICE 'NEW.performedOn = %', NEW.performedOn;

				-- Let's check if the 'PayAndGoPricePlan' customer requests bills
				SELECT wantsBill INTO requestsBill FROM freefall.PayAndGoPricePlan WHERE ordinaryPlan_ID = plan;

				-- Let's check the plan type
				SELECT planType INTO pType FROM freefall.OrdinaryPlan WHERE ordinaryPlan_ID = plan;

				-- If the plan associated to the contract is a 'PayAndGoPricePlan' and the customer requests bill
				-- or the plan is a 'PayMonthlyPricePlan' generate the bill, otherwise simply do nothing
				IF((pType = 'm' OR (pType = 'g' AND requestsBill)) AND (contractREF IS NOT NULL)) THEN
					RAISE NOTICE '';
					RAISE NOTICE '----------------------------------';
					
					-- We generate a new bill
					SELECT generate_bill_FNC(contractREF, NEW.performedOn) INTO details;

					RAISE NOTICE 'New bill created for contract = %.', contractREF;

					-- When the details array is not empty, print each detail	
					IF(details IS NOT NULL) THEN
						FOREACH x IN ARRAY details LOOP
							RAISE NOTICE '%', x;
						END LOOP;
					END IF;
					
					RAISE NOTICE '----------------------------------';
				END IF;

				---------------------------------------------------------------------------------------------------------
				-- Activity #4.6: Automatically deduct 50 € from bills of 'PayMonthlyPricePlan' contracts for which    --
				-- an expense of at least 150 € has been registered in the period from April 20, 2012 to May 20, 2012. --
				---------------------------------------------------------------------------------------------------------
				IF(pType = 'm') THEN
					-- Determine the right bill
					SELECT MAX(bill_ID) INTO maxBillID FROM freefall.Bill WHERE contract_REF = NEW.contract_REF;

					-- Calculate the operations' total amount from 'startDate' to 'endDate'
					SELECT SUM(operationCost) INTO operationsTotalAmount
					FROM freefall.BillDetail
					WHERE bill_REF = maxBillID
						AND
					performedOn::date >= startDate
						AND
					performedOn::date <= endDate;

					-- Ask if the customer already had a discount
					SELECT hadDiscount INTO alreadyHadDiscount FROM freefall.PayMonthlyPricePlan WHERE ordinaryPlan_ID = plan;

					-- We apply a discount only if it was never applied before. We could better this by substituting 'alreadyHadDiscount' with the date when the
					-- discount was last applied ('discountAppliedOn') and then check in the condition below whether ['today' - 'discountAppliedOn'] < Z, where Z
					-- is the number of days before which a new discount cannot be applied.
					IF(NOT alreadyHadDiscount) THEN
						-- We apply a discount 
						IF(operationsTotalAmount > discountThreshold) THEN
							RAISE NOTICE 'operationsTotalAmount = % is enough for the customer to be eligible for a discount..', operationsTotalAmount;

							-- Apply the discount
							UPDATE freefall.Bill SET totalAmount = totalAmount - discountAmount WHERE bill_ID = maxBillID;

							-- Remember it has been applied
							UPDATE freefall.PayMonthlyPricePlan SET hadDiscount = TRUE WHERE ordinaryPlan_ID = plan;

							-- Get the new bill's total amount
							SELECT totalAmount INTO newBillTotalAmount FROM freefall.Bill WHERE bill_ID = maxBillID;

							RAISE NOTICE 'NEW DISCOUNT APLLIED ON BILL = %. NEW BILL''S TOTAL AMOUNT IS %.', maxBillID, newBillTotalAmount;
						END IF;
					ELSE
						RAISE NOTICE 'DISCOUNT WAS ALREADY APLLIED. STATUS UNCHANGED.';
					END IF;
				END IF;
			END IF;
		END IF;

		RETURN NEW;
	END;
$$
LANGUAGE 'plpgsql';

CREATE TRIGGER a_check_if_bill_must_be_generated_TRG
AFTER INSERT ON freefall.Call
FOR EACH ROW
EXECUTE PROCEDURE freefall.check_if_bill_must_be_generated_FNC();

CREATE TRIGGER a_check_if_bill_must_be_generated_TRG
AFTER INSERT ON freefall.Message
FOR EACH ROW
EXECUTE PROCEDURE freefall.check_if_bill_must_be_generated_FNC();




-- Add the 'location' column to the 'Operation' table
ALTER TABLE freefall.Operation ADD COLUMN location GEOMETRY(Polygon, 3857);

-- THIS WON'T WORK: 'AddGeometryColumn()' causes an error (which is a known bug) when trying to transform coordinates
-- with the 'ST_TRANSFORM(geometry, integer)' function. We could omit to transform geometries in the functions below
-- and then use the AddGeometryColumn() function. But we have 'aree_verdi' (green areas), 'strade' (roads) and
-- 'edifici' (buildings) geometry columns' SRID set to 32632 and 'comuni' (cities) SRID which is apparently unknown.
-- We use a SRID=3857 for operations as we need to 
-- SELECT AddGeometryColumn('freefall', 'Operation', 'location', 3857, 'POLYGON', 2);




DROP FUNCTION IF EXISTS freefall.check_before_insert_into_operation_table_FNC() CASCADE;
-- FUNCTION: check_before_insert_into_operation_FNC()
---- DESCRIPTION: executes a series of checks before operations are actually performed
---- in: none
---- out: none
---- USAGE:  "INSERT INTO freefall.Message VALUES(...)"
---- OUTPUT: "ERROR:  Couldn't complete the operation: your balance is less than 0.2 €."
---- USAGE:  "INSERT INTO freefall.Call VALUES(...);
---- OUTPUT: "WARNING: Couldn't complete the operation: your balance is less than 0 €."
CREATE FUNCTION freefall.check_before_insert_into_operation_table_FNC() RETURNS TRIGGER AS
$$
	DECLARE planREF int;
	DECLARE threshold real;
	DECLARE operation text;
	DECLARE currentBalance numeric;
	DECLARE destination support.TelephoneNumber_t;
	DECLARE source support.TelephoneNumber_t;
	DECLARE isOperatorPrefix boolean;
	DECLARE isTownPrefix boolean;
	
	BEGIN
		-- Let's first  determine which threshold to use based on the table the trigger was actually fired on
		IF(tg_table_name = 'message') THEN
			threshold := 0.2;
			operation := 'message';
		ELSE
			threshold := 0.0;
			operation := 'call';
		END IF;


		-- Create a destination number object
		SELECT (NEW.receiverPhoneNumber).countryCode,
		       (NEW.receiverPhoneNumber).prefix,
		       (NEW.receiverPhoneNumber).coreNumber
		INTO destination;
		
		-- Create the source number object
		SELECT countryCode,
		       operatorPrefix,
		       coreNumber
		INTO source
 		FROM freefall.CellPhoneNumber
		WHERE cellPhoneNumber_ID = (SELECT C.cellPhoneNumber_REF
					     FROM freefall.Contract C
					     WHERE NEW.contract_REF = C.contract_ID);


		------------------------
		-- CHECK CONTRACT_REF --
		------------------------
		-- If the contract does not exist
		IF((SELECT contract_ID FROM freefall.Contract WHERE contract_ID = NEW.contract_REF) IS NULL) THEN
			RAISE WARNING '';
			RAISE WARNING '-------------------------------------------------------------------------------------------------------------------------------';
			RAISE WARNING 'Operation Type = %', operation;
			RAISE WARNING 'operation_ID = %', NEW.operation_ID;
			RAISE WARNING 'Operation Date and Time = %', NEW.performedOn;
			RAISE WARNING 'Contract = %', NEW.contract_REF;
			RAISE WARNING 'Destination Number = %', destination;
			RAISE WARNING 'ERROR: INSERT or update on table "%" violates foreign key constraint. contract_REF = % is not present in table "contract"', tg_table_name, NEW.contract_REF;
			RAISE WARNING '-------------------------------------------------------------------------------------------------------------------------------';
			RETURN NULL;
		END IF;


		--------------------------------
		-- CHECK A CONTRACT IS ACTIVE --
		--------------------------------
		-- If the cellphone number associated to the contract is NULL, then the contract has been deactivated
		IF((SELECT cellPhoneNumber_REF FROM freefall.Contract WHERE contract_ID = NEW.contract_REF) IS NULL) THEN
			RAISE WARNING '';
			RAISE WARNING '---------------------------------------------------------';
			RAISE WARNING 'Contract = % is no more active. Can''t perform operations.', NEW.contract_REF;
			RAISE WARNING '---------------------------------------------------------';
			RETURN NULL;
		END IF;

		-- We now save the contract reference the operation refers to
		SELECT ordinaryPlan_REF INTO planREF FROM freefall.Contract WHERE contract_ID = NEW.contract_REF;


		-------------------
		-- CHECK BALANCE --
		-------------------
		-- If the customer has a 'PayAndGoPricePlan'
		IF((SELECT planType FROM freefall.OrdinaryPlan WHERE ordinaryPlan_ID = planREF) = 'g') THEN
			SELECT balance INTO currentBalance FROM freefall.PayAndGoPricePlan WHERE payAndGoPricePlan_ID = planREF;
			-- Then if he has not enough money on his SIM CARD
			IF(currentBalance < threshold) THEN
				RAISE WARNING '';
				RAISE WARNING '------------------------------------------------------------------------------------';
				RAISE WARNING 'Operation Type = %', operation;
				RAISE WARNING 'operation_ID = %', NEW.operation_ID;
				RAISE WARNING 'Operation Date and Time = %', NEW.performedOn;
				RAISE WARNING 'Contract = %', NEW.contract_REF;
				RAISE WARNING 'Destination Number = %', destination;
				RAISE WARNING 'Couldn''t complete the operation. Your balance = % is less than % €: SKIPPING..', currentBalance, threshold;
				RAISE WARNING '------------------------------------------------------------------------------------';

				-- Abort current operation.
				RETURN NULL;
			END IF;
		END IF;
		

		------------------------------
		-- CHECK DESTINATION NUMBER --
		------------------------------

		-- Check if the destination number's prefix is actually valid
		IF(NOT(is_operator_prefix_FNC(destination.prefix)) AND NOT(is_town_prefix_FNC(destination.prefix))) THEN
			RAISE WARNING '';
			RAISE WARNING '---------------------------------------------';
			RAISE WARNING 'Operation Type = %', operation;
			RAISE WARNING 'operation_ID = %', NEW.operation_ID;
			RAISE WARNING 'Operation Date and Time = %', NEW.performedOn;
			RAISE WARNING 'Contract = %', NEW.contract_REF;
			RAISE WARNING 'Destination Number = %', destination;
 			RAISE WARNING 'Prefix = % is not valid: SKIPPING..', destination.prefix;
 			RAISE WARNING '---------------------------------------------';
 			RETURN NULL;
 		END IF;

		-- Retrieves the source cellphone number REF				
		-- Checks if the source and destination number are equal, in which case the operation is aborted
 		IF(source = destination) THEN
			RAISE WARNING '';
			RAISE WARNING '----------------------------------------------------------';
			RAISE WARNING 'Operation Type = %', operation;
			RAISE WARNING 'operation_ID = %', NEW.operation_ID;
			RAISE WARNING 'Operation Date and Time = %', NEW.performedOn;
			RAISE WARNING 'Contract = %', NEW.contract_REF;
			RAISE WARNING 'Destination Number = %', destination;
			RAISE WARNING 'Source and Destination numbers cannot be equal: SKIPPING..';
			RAISE WARNING '----------------------------------------------------------';
			
			RETURN NULL;
 		END IF;

		-- If everything went OK until now, then the operation can be performed
		RETURN NEW;
	END;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------------------------
-- Activity #4.3: Prevent a customer whose balance is less than 0.0 € from making (video)calls. --
--------------------------------------------------------------------------------------------------
CREATE TRIGGER check_before_insert_into_call_table_TRG
BEFORE INSERT ON freefall.Call
FOR EACH ROW
EXECUTE PROCEDURE freefall.check_before_insert_into_operation_table_FNC();
------------------------------------------------------------------------------------------------------
-- Activity #4.4: Prevent a customer whose balance is less than 0.2 € from sending (video)messages. --
------------------------------------------------------------------------------------------------------
CREATE TRIGGER check_before_insert_into_message_table_TRG
BEFORE INSERT ON freefall.Message
FOR EACH ROW
EXECUTE PROCEDURE freefall.check_before_insert_into_operation_table_FNC();




DROP FUNCTION IF EXISTS freefall.z_apply_promotion_FNC() CASCADE;
---------------------------------------------------------------------------------------------------------
-- Activity #4.5: Automatically activate a promotion for each 'PayAndGoPricePlan' contract for which   --
-- an expense of at least 150 € has been registered in the period from April 20, 2012 to May 20, 2012. --
---------------------------------------------------------------------------------------------------------
CREATE FUNCTION freefall.z_apply_promotion_FNC() RETURNS TRIGGER AS
$$
	DECLARE operationsTotalAmount numeric(5,2) := 0;
	DECLARE planREF int;
	DECLARE contractID int;
	DECLARE pType support.PlanTypes_d;
	DECLARE alreadyHadDiscount boolean := FALSE;
	DECLARE hadPromotion boolean;
	DECLARE favoriteID int;
	DECLARE promotionID int;
	DECLARE expirationDate timestamp;
	DECLARE newPromotion_ID int;
	
	DECLARE startDate date := '2012-04-20 00:00:00';
	DECLARE endDate date := '2012-05-20 23:59:59';
	DECLARE promotionThreshold numeric(5,2) := 150;
	
	BEGIN
		SELECT contract_ID, ordinaryPlan_REF INTO contractID, planREF FROM freefall.Contract WHERE contract_ID = NEW.contract_REF;
		
		SELECT planType INTO pType FROM freefall.OrdinaryPlan WHERE ordinaryPlan_ID = planREF;


		IF(pType = 'g') THEN

			-- Calculate the operations' total amount from 'startDate' to 'endDate'
			SELECT SUM(operationCost) INTO operationsTotalAmount
			FROM freefall.Operation
			WHERE contract_REF = contractID
				AND
			performedOn::date >= startDate
				AND
			performedOn::date <= endDate;

			RAISE NOTICE 'operationsTotalAmount = %', operationsTotalAmount;

			IF(operationsTotalAmount > promotionThreshold) THEN

				RAISE NOTICE 'operationsTotalAmount is enough for the customer to be eligible for a promotion..';

				SELECT TIMESTAMP 'now' + INTERVAL '30 days' INTO expirationDate;
				
				-- If the customer has no temporary promotions currently active, set a new one
				IF((SELECT activePromotion_REF FROM freefall.Contract WHERE contract_ID = contractID) IS NULL) THEN
					-- We create a new promotion whose favorite number is temporarily unknown. This will make the new promotion actually
					-- unapplicable until it is explicitly defined later by a customer's notice.
					INSERT INTO freefall.TemporaryPromotion VALUES(DEFAULT, expirationDate, 20, 3600, 50000, NULL); -- 20 SMSs, 1h in phone calls, 50MB in data traffic

					-- Get the just created promotion ID
					SELECT max(promotion_ID) INTO newPromotion_ID FROM freefall.TemporaryPromotion;
				
					-- Associate the contract to the new promotion
					UPDATE freefall.Contract SET activePromotion_REF = newPromotion_ID WHERE contract_ID = contractID;

					-- Set hadFreePromotion to TRUE
					UPDATE freefall.Contract SET hadFreePromotion = TRUE WHERE contract_ID = contractID;
					
					RAISE NOTICE 'NEW PROMOTION ACTIVATED.';
					RAISE NOTICE 'Operation_ID = %', NEW.operation_ID;

					RETURN NEW;
				-- If the customer has a temporary promotion currently active
				ELSE
					-- Let's check if he already had a free promotion
					-- NOTE: temporary promotions and free promotions are two different concepts
					SELECT hadFreePromotion INTO hadPromotion FROM freefall.Contract WHERE contract_ID = contractID;

					-- If not..
					IF(NOT hadPromotion) THEN

						-- We update its promotion values whatever they currently are
						UPDATE freefall.TemporaryPromotion SET 
							validUntil = expirationDate,
							freeSMSsLeft = 20,
							freeSecondsLeft = 3600,
							freeKBSLeft = 50000
						WHERE promotion_ID = (
							SELECT activePromotion_REF
							FROM freefall.Contract
							WHERE contract_ID = contractID
						);

						-- Set hadFreePromotion to TRUE
						UPDATE freefall.Contract SET hadFreePromotion = TRUE WHERE contract_ID = contractID;

						RAISE NOTICE 'NEW PROMOTION ACTIVATED.';

						RETURN NEW;
					END IF;

					RAISE NOTICE 'PROMOTION IS ALREADY ACTIVE. STATUS UNCHANGED.';
				END IF;
			END IF;
		END IF;

		RETURN NULL;
	END
$$
LANGUAGE plpgsql;
-- Here we use the trailing "_z" in the trigger name because we want these 2 triggers to be activated AFTER "make_call_TRG" and "send_message_TRG" are activated
CREATE TRIGGER z_apply_promotion_TRG
AFTER INSERT ON freefall.Call
FOR EACH ROW
EXECUTE PROCEDURE freefall.z_apply_promotion_FNC();

CREATE TRIGGER z_apply_promotion_TRG
AFTER INSERT ON freefall.Message
FOR EACH ROW
EXECUTE PROCEDURE freefall.z_apply_promotion_FNC();




----------------------------------------------------------------------------------------------------------------------------------
-- Activity #4.1: Keep the 'balance' field associated to a 'PayAndGoPricePlan' up-to-date after an operation has been executed. --
----------------------------------------------------------------------------------------------------------------------------------
DROP FUNCTION IF EXISTS freefall.make_call_FNC() CASCADE;
-- FUNCTION: make_call_FNC()
---- DESCRIPTION: decreases the balance associated to a PayAndGoPricePlan contract whose owner just made a call.
----              The balance amount is calculated internally.
----              It takes into account a TemporaryPromotion eventually active, updating it accordingly. (Why didn't we use
----              a separate function on this purpose? Because otherwise - being it not a trigger function (since it had to
----              be called freely inside the make_call_FNC() and send_message_FNC() trigger functions) - could potentially
----              have been misused. In the proposed way this is not possible, since both balances and TemporaryPromotion's
----              data are updated only when the associated function is triggered by a new call or a new message.)
---- in: none
---- out: none
---- USAGE:  "INSERT INTO freefall.Call VALUES(...)";
---- OUTPUT: "WARNING: Promotion could not be applied since either no promotion is available for the current customer or it has expired."
CREATE FUNCTION freefall.make_call_FNC() RETURNS TRIGGER AS
$$
	DECLARE video boolean;
	DECLARE international boolean;
	DECLARE originalDuration int;
	DECLARE actualDuration int;
	DECLARE plan int;
	DECLARE pType support.PlanTypes_d;
	DECLARE promotion int;
	DECLARE requestsBill boolean;
	DECLARE promotionIsValid boolean;
	DECLARE callPrc numeric(4,2) := 0;
	DECLARE intCallPrc numeric(4,2) := 0;
	DECLARE vdCallPrc numeric(4,2) := 0;
	DECLARE hypoTotalCost numeric(4,2);
	DECLARE actualTotalCost numeric(4,2) := -1;
	DECLARE secondsLeft int;
	DECLARE billREF int;
	DECLARE max int;
	DECLARE oldTotalAmount numeric(5,2);
	DECLARE newBalance numeric(5,2);
	DECLARE billTotal numeric(5,2);
	
	DECLARE destination support.TelephoneNumber_t;
	DECLARE favorite support.TelephoneNumber_t;

	BEGIN
  		-- First we determine if it's a (video)call an (international) call and store the duration of the call
 		SELECT isVideo INTO video FROM freefall.Operation WHERE operation_ID = NEW.operation_ID;

		SELECT isInternational, durationInSeconds INTO international, originalDuration FROM freefall.Call WHERE operation_ID = NEW.operation_ID;

		actualDuration := originalDuration;		
			
		-- Let's move to the associated contract
 		SELECT ordinaryPlan_REF INTO plan FROM freefall.Contract WHERE contract_ID = NEW.contract_REF;

 		-- Let's check if the 'PayAndGoPricePlan' customer requests bills
		SELECT wantsBill INTO requestsBill FROM freefall.PayAndGoPricePlan WHERE ordinaryPlan_ID = plan;
		
		-- Let's check the plan type
		SELECT planType INTO pType FROM freefall.OrdinaryPlan WHERE ordinaryPlan_ID = plan;
			
		-- Get the right call price: is it an international call?
 		IF(international) THEN
 			-- If it is a 'PayAndGoPricePlan'
 			IF(pType = 'g') THEN
 				-- In this case the calls price is the international calls price from 'PayAndGoPricePlan' table
				SELECT internationalCallPrice INTO intCallPrc FROM freefall.PayAndGoPricePlan WHERE ordinaryPlan_ID = plan;
 			-- If it is a 'PayMonthlyPricePlan' instead
 			ELSE
 				-- In this case the calls price is the international calls price from 'PayMonthlyPricePlan' table
 				SELECT internationalCallPrice INTO intCallPrc FROM freefall.PayMonthlyPricePlan WHERE ordinaryPlan_ID = plan;
 			END IF;
 		-- If it is not an international call
 		ELSE
 			-- Then if it is a 'PayMonthlyPricePlan'
 			IF(pType = 'g') THEN
 				-- Otherwise, the calls price is the regular calls price from 'PayAndGoPricePlan' table
 				SELECT callPrice INTO callPrc FROM freefall.PayAndGoPricePlan WHERE ordinaryPlan_ID = plan;
 			-- If it is a 'PayMonthlyPricePlan' instead
 			ELSE
 				-- Otherwise, the calls price is the regular calls price from 'PayMonthlyPricePlan' table
				SELECT callPrice INTO callPrc FROM freefall.PayMonthlyPricePlan WHERE ordinaryPlan_ID = plan;
 			END IF;
 		END IF;
  	
  		-- Is it a video call?
  		IF(video) THEN
  			-- If it is a 'PayAndGoPricePlan'
  			IF(pType = 'g') THEN
 				-- In this case the calls price is the international calls price from 'PayAndGoPricePlan' table
 				SELECT videoCallPrice INTO vdCallPrc FROM freefall.PayAndGoPricePlan WHERE ordinaryPlan_ID = plan;
 			-- If it is a 'PayMonthlyPricePlan' instead
 			ELSE
 				-- In this case the calls price is the international calls price from 'PayMonthlyPricePlan' table
 				SELECT videoCallPrice INTO vdCallPrc FROM freefall.PayMonthlyPricePlan WHERE ordinaryPlan_ID = plan;
 			END IF;
 		-- If it is not a video call
 		ELSE
 			-- Then if it is a 'PayMonthlyPricePlan'
 			IF(pType = 'g') THEN
 				-- Otherwise, the calls price is the regular calls price from 'PayAndGoPricePlan' table
 				SELECT callPrice INTO callPrc FROM freefall.PayAndGoPricePlan WHERE ordinaryPlan_ID = plan;
 			-- If it is a 'PayMonthlyPricePlan' instead
 			ELSE
 				-- Otherwise, the calls price is the regular calls price from 'PayMonthlyPricePlan' table
 				SELECT callPrice INTO callPrc FROM freefall.PayMonthlyPricePlan WHERE ordinaryPlan_ID = plan;
 			END IF;
 		END IF;


 		-- Check if the promotion is valid
 		SELECT activePromotion_REF INTO promotion FROM freefall.Contract WHERE contract_ID = NEW.contract_REF;
 		SELECT is_promotion_still_valid_FNC(promotion) INTO promotionIsValid;
 
 
 		-- Create a destination number object
 		SELECT (NEW.receiverPhoneNumber).countryCode,
 		       (NEW.receiverPhoneNumber).prefix,
 		       (NEW.receiverPhoneNumber).coreNumber
 		INTO destination;
 		
 		-- Create the source number object
 		SELECT countryCode,
 		       freefallPrefix,
 		       coreNumber
 		INTO favorite
 		FROM freefall.FreefallCellPhoneNumber
 		WHERE freefallNumber_ID = (SELECT T.favoriteNumber_REF
					    FROM freefall.TemporaryPromotion T
					    WHERE T.promotion_ID = promotion);


		-- Let's print some useful info to get a grasp of what's going on
		RAISE NOTICE '';
		RAISE NOTICE '----------------------';
		RAISE NOTICE 'Operation Type = %', tg_table_name;
		RAISE NOTICE 'Operation ID = %', NEW.operation_ID;
		RAISE NOTICE 'Operation Date and Time = %', NEW.performedOn;
		RAISE NOTICE 'Contract = %', NEW.contract_REF;
		RAISE NOTICE 'Plan Type = %', pType;
		RAISE NOTICE 'Wants bill? %', requestsBill;
		RAISE NOTICE 'Promotion = %', promotion;
		RAISE NOTICE 'Promotion is valid? %', promotionIsValid;
		RAISE NOTICE 'Favorite Number = %', favorite;
		RAISE NOTICE 'Destination Number = %', destination;
		RAISE NOTICE 'Destination = Favorite? %', destination = favorite;
		RAISE NOTICE 'Video? : %', video;
		RAISE NOTICE 'International? %', international;
		
		
 		-- MUST TAKE INTO ACCOUNT IF THE CUSTOMER HAS TEMPORARY ACTIVE PROMOTIONS
		IF(promotion IS NOT NULL AND promotionIsValid) THEN
			-- If the number being called is the favorite number
			IF(destination = favorite) THEN
				-- We must first know how many seconds the customer has left
				SELECT freeSecondsLeft INTO secondsLeft FROM freefall.TemporaryPromotion WHERE promotion_ID = promotion;

				-- More info..
				RAISE NOTICE 'Free Seconds Left = %', secondsLeft;
				
				-- If the remaining seconds are enough to carry out the complete operation
				IF(secondsLeft > actualDuration) THEN
					-- Set the remaining seconds to the actual remaining seconds after the operation
					UPDATE freefall.TemporaryPromotion SET freeSecondsLeft = secondsLeft - actualDuration WHERE promotion_ID = promotion;

					-- In this case the user will pay nothing: Oh-oh! Free calls! Nope. :)
					actualDuration := 0;
					actualTotalCost := 0;
				-- But if the remaining seconds will not suffice to carry out the entire operation
				ELSE
					-- Then set the remaining seconds to 0..
					UPDATE freefall.TemporaryPromotion SET freeSecondsLeft = 0 WHERE promotion_ID = promotion;

					-- ..and set the actual duration of the operation to be the original duration minus the seconds that were still available
					actualDuration := originalDuration - secondsLeft;
				END IF;
			ELSE
				RAISE WARNING '* Promotion could not be applied since the destination number is not the favorite number.';
 			END IF;
		ELSE
			RAISE WARNING '* Promotion could not be applied since either no promotion is available for the current customer or it has expired.';
 		END IF;
 				
 				
		-- Even more info..
		RAISE NOTICE 'Original Duration = %', originalDuration;
		RAISE NOTICE 'Actual Duration = %', actualDuration;
			
			
		IF(actualTotalCost < 0) THEN
			-- We now decide how much is to be charged based on the computed duration and the kind of operation (video and/or international)
			CASE
				-- VIDEO = FALSE, INTERNATIONAL = FALSE
				WHEN NOT video AND NOT international THEN
					-- Total cost is calculated based on the normal calls price 
					actualTotalCost := (callPrc / 60) * actualDuration;
					hypoTotalCost := (callPrc / 60) * originalDuration;
					RAISE NOTICE 'Calls Price = %', callPrc;
					RAISE NOTICE 'Hypothetical Total Cost = % [[((%) / 60) * %]]', hypoTotalCost, callPrc, originalDuration;
					RAISE NOTICE 'Actual Total Cost = % [((%) / 60) * %]', actualTotalCost, callPrc, actualDuration;
				-- VIDEO = FALSE, INTERNATIONAL = TRUE
				WHEN NOT video AND international THEN
					-- Total cost is calculated based on the international calls price
					actualTotalCost := (intCallPrc / 60) * actualDuration;
					hypoTotalCost := (intCallPrc / 60) * originalDuration;
					RAISE NOTICE 'International Calls Price = %', intCallPrc;
					RAISE NOTICE 'Hypothetical Total Cost = % [((%) / 60) * %]', hypoTotalCost, intCallPrc, originalDuration;
					RAISE NOTICE 'Actual Total Cost = % [((%) / 60) * %]', actualTotalCost, intCallPrc, actualDuration;
				-- VIDEO = TRUE, INTERNATIONAL = FALSE	
				WHEN video AND NOT international THEN
					-- Total cost is calculated based on the video calls price
					actualTotalCost := (vdCallPrc / 60) * actualDuration;
					hypoTotalCost := (vdCallPrc / 60) * originalDuration;
					RAISE NOTICE 'Video Calls Price = %', vdCallPrc;
					RAISE NOTICE 'Hypothetical Total Cost = % [((%) / 60) * %]', hypoTotalCost, vdCallPrc, originalDuration;
					RAISE NOTICE 'Actual Total Cost = % [((%) / 60) * %]', actualTotalCost, vdCallPrc, actualDuration;
				-- VIDEO = TRUE, INTERNATIONAL = TRUE
				ELSE
					-- Total cost is calculated based on both international and video calls prices 
					actualTotalCost := ((intCallPrc + vdCallPrc) / 60) * actualDuration;
					hypoTotalCost := ((intCallPrc + vdCallPrc) / 60) * originalDuration;
					RAISE NOTICE 'International Calls Price = %', intCallPrc;
					RAISE NOTICE 'Video Calls Price = %', vdCallPrc;
					RAISE NOTICE 'Hypothetical Total Cost = % [((% + %) / 60) * %]', hypoTotalCost, intCallPrc, vdCallPrc, originalDuration;
					RAISE NOTICE 'Actual Total Cost = % [((% + %) / 60) * %]', actualTotalCost, intCallPrc, vdCallPrc, actualDuration;
			END CASE;
		END IF;
		
  				
  		-- Update the operation cost field
  		UPDATE freefall.Call SET operationCost = actualTotalCost WHERE operation_ID = NEW.operation_ID;

		-- ..Update the balance
		UPDATE freefall.PayAndGoPricePlan SET balance = balance - actualTotalCost WHERE payAndGoPricePlan_ID = plan;

		SELECT balance INTO newBalance FROM freefall.PayAndGoPricePlan WHERE payAndGoPricePlan_ID = plan;

		IF(pType = 'g') THEN
			RAISE NOTICE 'New balance = %', newBalance;
		END IF;

		RETURN NULL;
	END
$$
LANGUAGE plpgsql;

CREATE TRIGGER make_call_TRG
AFTER INSERT ON freefall.Call
FOR EACH ROW 
EXECUTE PROCEDURE freefall.make_call_FNC();




----------------------------------------------------------------------------------------------------------------------------------
-- Activity #4.1: Keep the 'balance' field associated to a 'PayAndGoPricePlan' up-to-date after an operation has been executed. --
----------------------------------------------------------------------------------------------------------------------------------
DROP FUNCTION IF EXISTS freefall.send_message_FNC() CASCADE;
-- FUNCTION: send_message_FNC()
---- DESCRIPTION: decreases the balance associated to a PayAndGoPricePlan contract whose owner just sent a (video)message.
----              The balance amount is calculated internally.
----              It takes into account a TemporaryPromotion eventually active, updating it accordingly. (Why didn't we use
----              a separate function on this purpose? Because otherwise - being it not a trigger function (since it had to
----              be called freely inside the make_call_FNC() and send_message_FNC() trigger functions) - could potentially
----              have been misused. In the proposed way this is not possible, since both balances and TemporaryPromotion's
----              data are updated only when the associated function is triggered by a new call or a new message.)
---- in: none
---- out: none
---- USAGE:  "INSERT INTO freefall.Message VALUES(...);"
---- OUTPUT: "WARNING:  Promotion could not be applied since the destination number is not the favorite number."
CREATE FUNCTION freefall.send_message_FNC() RETURNS TRIGGER AS
$$
	DECLARE transmData int;
	DECLARE KBsLeft int;
	DECLARE SMSsLeft int;
	DECLARE actualTransmData int;
	DECLARE video boolean;
	DECLARE international boolean;
	DECLARE plan int;
	DECLARE pType support.PlanTypes_d;
	DECLARE requestsBill boolean;
	DECLARE promotion int;
	DECLARE promotionIsValid boolean;
	DECLARE SMSprc numeric(4,2) := 0;
	DECLARE MMSprc numeric(4,2) := 0;
	DECLARE factor numeric(2,1);
	DECLARE hypoTotalCost numeric(4,2);
	DECLARE actualTotalCost numeric(4,2) := -1;
	DECLARE billREF int;
	DECLARE max int;
	DECLARE oldTotalAmount numeric(5,2);
	DECLARE newBalance numeric(5,2);
	DECLARE billTotal numeric(5,2);

	DECLARE destination support.TelephoneNumber_t;
	DECLARE favorite support.TelephoneNumber_t;
	
	BEGIN
		-- First we determine if it's a (video)message and/or an (international)message and store the transmitted data
		SELECT transmittedKBs, isVideo, isInternational INTO transmData, video, international FROM freefall.Message WHERE operation_ID = NEW.operation_ID;
		actualTransmData := transmData;

		-- Let's move to the associated contract
		SELECT ordinaryPlan_REF INTO plan FROM freefall.Contract WHERE contract_ID = NEW.contract_REF;

		-- Let's check the plan type
		SELECT planType INTO pType FROM freefall.OrdinaryPlan WHERE ordinaryPlan_ID = plan;

		-- Let's check if the 'PayAndGoPricePlan' customer requests bills
		SELECT wantsBill INTO requestsBill FROM freefall.PayAndGoPricePlan WHERE ordinaryPlan_ID = plan;

		-- Get the right call price: is it an international call?
		IF(international) THEN
			IF(pType = 'g') THEN
				-- We store the international message multiplier factor, a value used to compute the final message price
				SELECT internationalMessageMultFactor INTO factor FROM freefall.PayAndGoPricePlan WHERE ordinaryPlan_ID = plan;
			ELSE
				-- We store the international message multiplier factor, a value used to compute the final message price
				SELECT internationalMessageMultFactor INTO factor FROM freefall.PayMonthlyPricePlan WHERE ordinaryPlan_ID = plan;
			END IF;
		END IF;

		IF(video) THEN
			IF(pType = 'g') THEN
				-- In this case the message price is the MMSPrice
				SELECT MMSPrice INTO MMSprc FROM freefall.PayAndGoPricePlan WHERE ordinaryPlan_ID = plan;
			ELSE 
				-- In this case the message price is the MMSPrice
				SELECT MMSPrice INTO MMSprc FROM freefall.PayMonthlyPricePlan WHERE ordinaryPlan_ID = plan;
			END IF;
		ELSE
			IF(pType = 'g') THEN
				-- Otherwise, the message price is the regular MMSPrice
				SELECT SMSPrice INTO SMSprc FROM freefall.PayAndGoPricePlan WHERE ordinaryPlan_ID = plan;

			ELSE
				-- Otherwise, the message price is the regular MMSPrice
				SELECT SMSPrice INTO SMSprc FROM freefall.PayMonthlyPricePlan WHERE ordinaryPlan_ID = plan;
			END IF;
		END IF;


		-- Check if the promotion is valid
 		SELECT activePromotion_REF INTO promotion FROM freefall.Contract WHERE contract_ID = NEW.contract_REF;
 		SELECT is_promotion_still_valid_FNC(promotion) INTO promotionIsValid;
 
 
 		-- Create a destination number object
 		SELECT (NEW.receiverPhoneNumber).countryCode,
 		       (NEW.receiverPhoneNumber).prefix,
 		       (NEW.receiverPhoneNumber).coreNumber
 		INTO destination;
 		
 		-- Create the source number object
 		SELECT countryCode,
 		       freefallPrefix,
 		       coreNumber
 		INTO favorite
 		FROM freefall.FreefallCellPhoneNumber
 		WHERE freefallNumber_ID = (SELECT T.favoriteNumber_REF
					    FROM freefall.TemporaryPromotion T
					    WHERE T.promotion_ID = promotion);


		-- Let's print some useful info to get a grasp of what's going on
		RAISE NOTICE '';
		RAISE NOTICE '----------------------';
		RAISE NOTICE 'Operation Type = %', tg_table_name;
		RAISE NOTICE 'Operation ID = %', NEW.operation_ID;
		RAISE NOTICE 'Operation Date and Time = %', NEW.performedOn;
		RAISE NOTICE 'Contract = %', NEW.contract_REF;
		RAISE NOTICE 'Plan Type = %', pType;
		RAISE NOTICE 'Wants bill? %', requestsBill;
		RAISE NOTICE 'Promotion = %', promotion;
		RAISE NOTICE 'Promotion is valid? %', promotionIsValid;
		RAISE NOTICE 'Favorite Number = %', favorite;
		RAISE NOTICE 'Destination Number = %', destination;
		RAISE NOTICE 'Destination = Favorite? %', destination = favorite;
		RAISE NOTICE 'Video? : %', video;
		RAISE NOTICE 'International? %', international;				

		-- MUST TAKE INTO ACCOUNT IF THE CUSTOMER HAS TEMPORARY ACTIVE PROMOTIONS
		IF(promotion IS NOT NULL AND promotionIsValid) THEN
			-- If the number being called is the favorite number
			IF(destination = favorite) THEN
				-- If it is an MMS
				IF(video) THEN
					-- We must first know how many free KBs the customer has left
					SELECT freeKBsLeft INTO KBsLeft FROM freefall.TemporaryPromotion WHERE promotion_ID = promotion;

					RAISE NOTICE 'Transmitted Data = % KB', transmData;
					RAISE NOTICE 'Free KBs Left = %', KBsLeft;

					-- If the remaining KBs are enough to carry out the complete operation
					IF(KBsLeft > actualTransmData) THEN
						RAISE NOTICE 'Actual Transmitted Data = %', actualTransmData;
						
						-- Set the remaining KBs to the actual remaining KBs after the operation
						UPDATE freefall.TemporaryPromotion SET freeKBsLeft = KBsLeft - transmData WHERE promotion_ID = promotion;

						-- In this case the user will pay nothing: Oh-oh! Free messages! Nope. :)
						actualTransmData := 0;

						RAISE NOTICE 'Enough free KBs left: NOTHING TO BE PAID.';

						-- Get the new KBs left
						SELECT freeKBsLeft INTO KBsLeft FROM freefall.TemporaryPromotion WHERE promotion_ID = promotion;
						RAISE NOTICE 'FreeKBsLeft = %', KBsLeft;
						
					-- But if the remaining KBs will not suffice to carry out the entire operation
					ELSE
						-- Then set the remaining KBs to 0..
						UPDATE freefall.TemporaryPromotion SET freeKBsLeft = 0 WHERE promotion_ID = promotion;

						-- ..and set the actual transmitted KBs to be the original KBs minus the KBs that were still available
						actualTransmData := transmData - KBsLeft;
					END IF;
				-- If it is a normal SMS
				ELSE
					-- We must first know how many free SMSs the customer has left
					SELECT freeSMSsLeft INTO SMSsLeft FROM freefall.TemporaryPromotion WHERE promotion_ID = promotion;
					
					IF(SMSsLeft > 0) THEN
						RAISE NOTICE 'Free SMSs Left = %', SMSsLeft;
						
						-- Decrease the left SMSs count by 1
						UPDATE freefall.TemporaryPromotion SET freeSMSsLeft = freeSMSsLeft - 1 WHERE promotion_ID = promotion;

						-- Nothing to be paid
						actualTotalCost := 0;

						RAISE NOTICE 'Enough free SMSs left: NOTHING TO BE PAID.';
						RAISE NOTICE 'Free SMSs Left = %', SMSsLeft - 1;
					-- If the customer has not enough free SMSs left
					ELSE
						RAISE NOTICE 'No SMSs left.';
					END IF;
				END IF;
			ELSE
				RAISE WARNING '* Promotion could not be applied since the destination number is not the favorite number.';
			END IF;
		ELSE
			RAISE WARNING '* Promotion could not be applied since either no promotion is available for the current customer or it has expired.';
		END IF;

		-- If the totalCost has not been updated previously by the check over TemporaryPromotion
		IF(actualTotalCost < 0) THEN
			-- We now decide how much is to be charged based on the transmitted data and the kind of operation (video and/or international)
			CASE
				-- VIDEO = FALSE, INTERNATIONAL = FALSE
				WHEN NOT video AND NOT international THEN -- Typical SMS
					-- Total cost is calculated based on the normal SMSs price 
					actualTotalCost := SMSprc;
					hypoTotalCost := actualTotalCost;
					RAISE NOTICE 'SMS Price = %', SMSprc;
					RAISE NOTICE 'Hypothetical Total Cost = % [%]', hypoTotalCost, SMSprc;
					RAISE NOTICE 'Actual Total Cost = % [%]', actualTotalCost, SMSprc;
				-- VIDEO = FALSE, INTERNATIONAL = TRUE
				WHEN NOT video AND international THEN -- International SMS
					-- Total cost is calculated based on the SMSs price multiplied by the international message multiplier
					actualTotalCost := SMSprc * factor;
					hypoTotalCost := actualTotalCost;
					RAISE NOTICE 'SMS price = %', SMSprc;
					RAISE NOTICE 'Hypothetical Total Cost = % [% * %]', hypoTotalCost, SMSprc, factor;
					RAISE NOTICE 'Actual Total Cost = % [% * %]', actualTotalCost, SMSprc, factor;
				-- VIDEO = TRUE, INTERNATIONAL = FALSE	
				WHEN video AND NOT international THEN -- Typical MMS
					-- Total cost is calculated based on the MMSs price and the transmitted data
					actualTotalCost := ((MMSprc / 1000) * 3) * actualTransmData;
					hypoTotalCost := ((MMSPrc / 1000) * 3) * transmData;
					RAISE NOTICE 'MMS Price = %', MMSprc;
					RAISE NOTICE 'Hypothetical Total Cost = % [((% / 1000) * 3) * %]', hypoTotalCost, MMSprc, transmData;
					RAISE NOTICE 'Actual Total Cost = % [((% / 1000) * 3) * %]', actualTotalCost, MMSprc, actualTransmData;
				-- VIDEO = TRUE, INTERNATIONAL = TRUE
				ELSE -- International MMS
					-- Total cost is calculated based on the MMSs price multiplied by a (scaled) logaritmic factor
					actualTotalCost := ((MMSprc * trunc(ln(factor), 2)) / 50) * actualTransmData;
					hypoTotalCost := ((MMSprc * trunc(ln(factor), 2)) / 50) * transmData;
					RAISE NOTICE 'MMS price = %', MMSprc;
					RAISE NOTICE 'Hypothetical Total Cost = % [((% * %) / 100) * %]', hypoTotalCost, MMSprc, trunc(ln(factor), 2), transmData;
					RAISE NOTICE 'Actual Total Cost = % [((% * %) / 100) * %]', actualTotalCost, MMSprc, trunc(ln(factor), 2), actualTransmData;
			END CASE;
		END IF;


		-- Update the operation cost field
		UPDATE freefall.Message SET operationCost = actualTotalCost WHERE operation_ID = NEW.operation_ID;

		-- ..Update the balance
		UPDATE freefall.PayAndGoPricePlan SET balance = balance - actualTotalCost WHERE payAndGoPricePlan_ID = plan;
		SELECT balance INTO newBalance FROM freefall.PayAndGoPricePlan WHERE payAndGoPricePlan_ID = plan;

		IF(pType = 'g') THEN
			RAISE NOTICE 'New balance = %', newBalance;
		END IF;
	
		RETURN NULL;
	END
$$
LANGUAGE plpgsql;

CREATE TRIGGER send_message_TRG
AFTER INSERT ON freefall.Message
FOR EACH ROW
EXECUTE PROCEDURE freefall.send_message_FNC();




DROP FUNCTION IF EXISTS operation_not_allowed_FNC(operationType text, _table text) CASCADE;
-- FUNCTION: operation_not_allowed_FNC(text, text)
---- DESCRIPTION: prevents an operation from being executed on a given table
---- in: operationType = the operation being carried out
---- in: _table = the table which the operation is being carried out on
---- out: an exception, the operation is therefore always aborted
---- USAGE: "CREATE RULE no_insert_in_address_table AS ON INSERT TO freefall.Address DO INSTEAD SELECT operation_not_allowed('INSERT', 'Address');"
---- OUTPUT: "ERROR: Operation not allowed: INSERT INTO Address"
CREATE FUNCTION operation_not_allowed_FNC(operationType text, _table text) RETURNS VOID AS
$$
	DECLARE clause text;
	
	BEGIN
		CASE
			WHEN operationType = 'INSERT' THEN clause := 'INTO';
			WHEN operationType = 'UPDATE' THEN clause := '';
			WHEN operationType = 'DELETE' THEN clause := 'FROM';
		END CASE;
		
		RAISE EXCEPTION 'Operation not allowed: % % %', operationType, clause, _table;
	END
$$
LANGUAGE plpgsql;




DROP FUNCTION IF EXISTS get_customer_names_by_XYZ_FNC(X date, Y int, Z int) CASCADE;
-------------------------------------------------------------------------------------
-- Activity 5.3.a) : Show the names of all customers who, on day X, made more than --
-- Y operations in places which distance from Lodi's city center is less than Z.   --
-- Z has a granularity of 1 meter.                                                 --
-------------------------------------------------------------------------------------
CREATE FUNCTION get_customer_names_by_XYZ_FNC(X date, Y int, Z int) RETURNS TABLE(name text, surname text, operation_ID int, "date" date, "query distance" int, "computed distance" numeric) AS
$$
	-- It conventionally corresponds to the location where Google Maps by default puts its placeholder when typing "Lodi" 
	DECLARE lodiCenter geometry := ST_BUFFER(ST_GeomFromEWKT('srid=3857;POINT(1057739.095 5671055.648)'), 5);

	BEGIN
		IF(Y >= 0) THEN
			IF(Z > 0) THEN
				IF(X > '1900-01-01' AND X <= 'today') THEN
					RETURN QUERY
						SELECT CU.name, CU.surname, OP1.operation_ID, OP1.performedOn::date, Z, TRUNC(ST_DISTANCE(OP1.location, lodiCenter)::numeric, 2) AS computedDistance
						FROM (freefall.Operation OP1 JOIN freefall.Operation OP2 ON OP1.operation_ID = OP2.operation_ID) JOIN (freefall.Contract CO JOIN freefall.Customer CU ON CO.customer_REF = CU.customer_ID) ON OP1.contract_REF = CO.contract_ID
						WHERE OP1.performedOn::date = X
							AND ST_DISTANCE(OP1.location, lodiCenter) <= Z
							AND Y <= (SELECT COUNT(OP3.performedOn)
								  FROM freefall.Operation OP3
								  WHERE OP3.operation_ID = OP2.operation_ID)
						GROUP BY CU.name, CU.surname, OP1.operation_ID, OP1.performedOn, computedDistance
						ORDER BY computedDistance, CU.surname, CU.name;	
				ELSE
					RAISE EXCEPTION 'Value of X must be in the range [''1900-01-01'', ''today''] in ''getCustomerNamesByXYZ_f(X, Y, Z)'' function';
				END IF;
			ELSE
				RAISE EXCEPTION 'Value of Z must be at least 1 in ''getCustomerNamesByXYZ_f(X, Y, Z)'' function';
			END IF;
		ELSE
			RAISE EXCEPTION 'Value of Y must be at least 0 in ''getCustomerNamesByXYZ_f(X, Y, Z)'' function';
		END IF;
	END;
$$
LANGUAGE plpgsql;




DROP VIEW IF EXISTS support.TownsSortedByGeographicalExtensions_v CASCADE;
-- This view computes the geographical extension of each city in the province of Lodi
-- and shows it together with its istat code, name and total geometry.
CREATE VIEW support.TownsSortedByGeographicalExtensions_v AS
	SELECT C.pro_com, LPIC.city, SUM(shape_area) AS area, ST_UNION(C.geom) AS city_geom
	FROM comuni C JOIN support.LodiProvinceIstatCodes LPIC ON c.pro_com = LPIC.istatCode
	GROUP BY C.pro_com, LPIC.city 
	ORDER BY SUM(shape_area) DESC;




DROP TABLE IF EXISTS support.TopKCities CASCADE;
-- This table is populated in the 'get_top_K_cities_FNC' function below
CREATE TABLE support.TopKCities (
	operation_id int PRIMARY KEY,
	istat int
);




DROP FUNCTION IF EXISTS get_top_K_cities_FNC(K int) CASCADE;
------------------------------------------------------------------------------------------------------------
-- Activity 5.3.b) : Show the names of the K cities where the majority of operations have been performed. --
-- The list must be ordered by the decreasing values of number operations.                                --
------------------------------------------------------------------------------------------------------------
CREATE FUNCTION get_top_K_cities_FNC(K int) RETURNS TABLE("istat code" int, "city" text, "# operations" bigint) AS
$$
	DECLARE op freefall.Operation%rowtype;
	DECLARE city support.TownsSortedByGeographicalExtensions_v%rowtype;
	
	BEGIN
		-- We populate the 'TopKCities' table by which city contains a given operation
		FOR city IN SELECT * FROM support.TownsSortedByGeographicalExtensions_v LOOP
			FOR op IN SELECT * FROM freefall.Operation LOOP
				IF ST_CONTAINS(ST_TRANSFORM(city.city_geom, 3857), op.location) THEN
					INSERT INTO support.TopKCities VALUES(op.operation_ID, city.pro_com);
				END IF;
			END LOOP;
		END LOOP;

		-- We then count how many operations have been performed in each city and
		-- order the result set by this value, limiting it to the first K rows.
		RETURN QUERY
			SELECT TKC.istat, LPIC.city, COUNT(TKC.istat)
			FROM support.TopKCities TKC JOIN support.LodiProvinceIstatCodes LPIC ON TKC.istat = LPIC.istatCode
			GROUP BY TKC.istat, LPIC.city
			ORDER BY COUNT(TKC.istat) DESC, LPIC.city ASC
			LIMIT K;
 	END;
$$
LANGUAGE 'plpgsql';




DROP TABLE IF EXISTS support.CustomerPath CASCADE;
-- This table holds the set op point which represent the operations made by a given customer.
-- It is replaced by successive calls of the 'create_customer_path_FNC' functions on different customers.
CREATE TABLE support.CustomerPath (
	id int,
	op_id int,
	date timestamp,
	points geometry
);




DROP FUNCTION IF EXISTS create_customer_path_FNC(customerID int) CASCADE;
-----------------------------------------------------------------------------------
-- Activity 5.3.c) : Show the customer's path given by the operations performed. --
-----------------------------------------------------------------------------------
CREATE FUNCTION create_customer_path_FNC(customerID int) RETURNS VOID AS
$$
	DECLARE customer int;

 	BEGIN
		-- Check if the customer actually exists
		SELECT customer_ID INTO customer FROM freefall.Customer WHERE customer_ID = customerID;
		
		IF(customer IS NOT NULL) THEN
			-- We insert into the 'CustomerPath' table the customer_ID, the operation_ID, the timestamp of the operation and the coordinates of the operation's centroid
			INSERT INTO support.CustomerPath
				SELECT CU.customer_ID, O.operation_ID, O.performedOn, ST_CENTROID(O.location) AS path
				FROM (freefall.Operation O JOIN freefall.Contract C ON O.contract_REF = C.contract_ID) JOIN freefall.Customer CU ON C.customer_REF = CU.customer_ID
				WHERE customer_ID = customer
				GROUP BY CU.customer_ID, O.operation_ID, O.performedOn, O.location
				ORDER BY O.performedOn;

			RAISE NOTICE '';
			RAISE NOTICE 'Path for customer_ID = % successfully created!', customerID;
			RAISE NOTICE '';
		ELSE
			RAISE EXCEPTION 'Customer not found: %', customer;
		END IF;
	END
$$
LANGUAGE 'plpgsql';




DROP FUNCTION IF EXISTS show_operations_in_cities_with_wide_green_areas_FNC() CASCADE;
------------------------------------------------------------------------------------------------------------------------------
-- Activity 5.3.d) : Show how many operations have been performed in a city where:                                          --
-- #1) at least one wide green area is present                                                                              --
-- AND                                                                                                                      --
-- #2) it borders a city where at least one wide green area is present.                                                     --
------------------------------------------------------------------------------------------------------------------------------
CREATE FUNCTION show_operations_in_cities_with_wide_green_areas_FNC() RETURNS TABLE(istat int, city text, "# operations" bigint) AS
$$
	BEGIN
		-- We create a view of cities which contain green areas which area is greater than or equal to 15,000 square metres.
		-- This view models the first of the two conditions.
		CREATE VIEW support.CitiesContainingWideGreenAreas_v AS
			SELECT AV.gid, TSBGE.pro_com, TSBGE.city, ST_AREA(AV.geom) AS area, TSBGE.city_geom
			FROM support.TownsSortedByGeographicalExtensions_v TSBGE INNER JOIN aree_verdi AV ON ST_AREA(AV.geom) > 15000
			WHERE ST_COVERS(ST_TRANSFORM(TSBGE.city_geom, 32632), AV.geom);

		-- Then we create a view containing cities that in addition to condition #1, respect condition #2 too.
		-- This is done joining the view 'CitiesContainingWideGreenAreas_v' above with itself with the join condition
		-- being a spatial operation ST_TOUCHES(geom1, geom2) which tells if geom1 borders geom2.
		CREATE VIEW support.CitiesBordering_v AS
			SELECT DISTINCT ON (CCWGA1.gid, CCWGA1.pro_com) CCWGA1.*
			FROM support.CitiesContainingWideGreenAreas_v CCWGA1 INNER JOIN support.CitiesContainingWideGreenAreas_v CCWGA2
				ON ST_TOUCHES(CCWGA1.city_geom, CCWGA2.city_geom)
			WHERE CCWGA1.pro_com <> CCWGA2.pro_com;

		-- Finally, we return istat codes, city names and how many operations have been performed in each one.
		-- Here, we transform the city's geometry SRID (32632) in that of the operation's one (3857) 
		RETURN QUERY
			SELECT CCWGA.pro_com, CCWGA.city, COUNT(DISTINCT OP.operation_ID) AS "# operations"
			FROM support.CitiesContainingWideGreenAreas_v AS CCWGA, freefall.Operation OP
			WHERE ST_WITHIN(OP.location, ST_TRANSFORM(CCWGA.city_geom, 3857))
				AND CCWGA.city IN (
					SELECT CCWGA1.city
					FROM support.CitiesBordering_v CCWGA1
				)
			GROUP BY CCWGA.pro_com, CCWGA.city
			ORDER BY "# operations" DESC, CCWGA.city ASC;
			
	END
$$
LANGUAGE 'plpgsql';




DROP TABLE IF EXISTS support.TopCustomers CASCADE;
-- This support table is used by the 'get_top_customers_in_province_FNC()' function below.
-- It is not part of the model as it has been introduced only for implementation purposes.
CREATE TABLE support.TopCustomers (
	operation_id int PRIMARY KEY,
	contract_ref int,
	istat text
);




DROP FUNCTION IF EXISTS get_top_customers_in_province_FNC() CASCADE;
------------------------------------------------------------------------------------------------------
-- Activity 5.3.e) : Show the names of customers who made operations in the majority of cities.     --
------------------------------------------------------------------------------------------------------
CREATE FUNCTION get_top_customers_in_province_FNC() RETURNS TABLE(customer_id int, name text, surname text, "# cities" bigint) AS
$$
	DECLARE op freefall.Operation%rowtype;
	DECLARE city support.TownsSortedByGeographicalExtensions_v%rowtype;

	BEGIN
		-- We store in the 'TopCustomers' table the operation_ID, the contract_REF and the istat code
		-- of the city where the operation has taken place, row by row for each operation and city
		FOR city IN SELECT * FROM support.TownsSortedByGeographicalExtensions_v LOOP
			FOR op IN SELECT * FROM freefall.Operation LOOP
				IF ST_CONTAINS(ST_TRANSFORM(city.city_geom, 3857), op.location) THEN
					INSERT INTO support.TopCustomers VALUES(op.operation_ID, op.contract_REF, city.pro_com);
				END IF;
			END LOOP;
		END LOOP;

		-- We then store the customer name, his surname and the name of the city
		CREATE VIEW support.TopCustomersInProvince_v AS 
			SELECT TC.operation_ID, CU.customer_ID, CU.name, CU.surname, TSBGE.pro_com, TSBGE.city
			FROM ((support.TownsSortedByGeographicalExtensions_v TSBGE JOIN support.TopCustomers TC ON TSBGE.pro_com = TC.istat::integer) JOIN freefall.Contract CO ON TC.contract_ref = CO.contract_ID) JOIN freefall.Customer CU ON CO.customer_REF = CU.customer_ID
			GROUP BY TC.operation_ID, CU.customer_ID, CU.name, CU.surname, TSBGE.pro_com, TSBGE.city
			ORDER BY surname, name;

		-- Finally we return the customer_ID, his name, his surname and how many different cities he made operations in
		RETURN QUERY
			SELECT TCIP.customer_ID, TCIP.name, TCIP.surname, COUNT(DISTINCT TCIP.city)
			FROM support.TopCustomersInProvince_v TCIP
			GROUP BY TCIP.customer_ID, TCIP.name, TCIP.surname
			ORDER BY COUNT(DISTINCT TCIP.city) DESC;
	END
$$
LANGUAGE 'plpgsql';




--------------------------------------------
-- PREVENT SOME OPERATIONS ON BASE TABLES --
--------------------------------------------

-- Prevents INSERTs, UPDATEs and DELETEs from parent 'TelephoneNumber' table. We do not want incomplete telephone numbers
CREATE RULE no_insert_in_telephonenumber_table AS ON INSERT TO freefall.TelephoneNumber DO INSTEAD SELECT operation_not_allowed_FNC('INSERT', 'TelephoneNumber');
CREATE RULE no_update_in_telephonenumber_table AS ON UPDATE TO freefall.TelephoneNumber DO INSTEAD SELECT operation_not_allowed_FNC('UPDATE', 'TelephoneNumber');
CREATE RULE no_delete_in_telephonenumber_table AS ON DELETE TO freefall.TelephoneNumber DO INSTEAD SELECT operation_not_allowed_FNC('DELETE', 'TelephoneNumber');

-- Prevents INSERTs, UPDATEs and DELETEs from parent 'Address' table. We do not want incomplete addresses
CREATE RULE no_insert_in_address_table AS ON INSERT TO freefall.Address DO INSTEAD SELECT operation_not_allowed_FNC('INSERT', 'Address');
CREATE RULE no_update_in_address_table AS ON UPDATE TO freefall.Address DO INSTEAD SELECT operation_not_allowed_FNC('UPDATE', 'Address');
CREATE RULE no_delete_in_address_table AS ON DELETE TO freefall.Address DO INSTEAD SELECT operation_not_allowed_FNC('DELETE', 'Address');

-- Prevents INSERTs, UPDATEs and DELETEs from parent 'Operation' table. We do not want incomplete operations
CREATE RULE no_insert_in_operation_table AS ON INSERT TO freefall.Operation DO INSTEAD SELECT operation_not_allowed_FNC('INSERT', 'Operation');
CREATE RULE no_update_in_operation_table AS ON UPDATE TO freefall.Operation DO INSTEAD SELECT operation_not_allowed_FNC('UPDATE', 'Operation');
CREATE RULE no_delete_in_operation_table AS ON DELETE TO freefall.Operation DO INSTEAD SELECT operation_not_allowed_FNC('DELETE', 'Operation');

-- Prevents INSERTs, UPDATEs and DELETEs from parent 'OrdinaryPlan' table. We do not want incomplete ordinary plans
CREATE RULE no_insert_in_ordinaryplan_table AS ON INSERT TO freefall.OrdinaryPlan DO INSTEAD SELECT operation_not_allowed_FNC('INSERT', 'OrdinaryPlan');
CREATE RULE no_update_in_ordinaryplan_table AS ON UPDATE TO freefall.OrdinaryPlan DO INSTEAD SELECT operation_not_allowed_FNC('UPDATE', 'OrdinaryPlan');
CREATE RULE no_delete_in_ordinaryplan_table AS ON DELETE TO freefall.OrdinaryPlan DO INSTEAD SELECT operation_not_allowed_FNC('DELETE', 'OrdinaryPlan');

-- Prevents INSERTs, UPDATEs and DELETEs from parent 'BankAccount' table. We do not want incomplete bank accounts
CREATE RULE no_insert_in_bankaccount_table AS ON INSERT TO freefall.BankAccount DO INSTEAD SELECT operation_not_allowed_FNC('INSERT', 'BankAccount');
CREATE RULE no_update_in_bankaccount_table AS ON UPDATE TO freefall.BankAccount DO INSTEAD SELECT operation_not_allowed_FNC('INSERT', 'BankAccount');
CREATE RULE no_delete_in_bankaccount_table AS ON DELETE TO freefall.BankAccount DO INSTEAD SELECT operation_not_allowed_FNC('INSERT', 'BankAccount');

-- These are gonna fail:
-- -- INSERT INTO freefall.Address VALUES(DEFAULT, 'Italy', 'Brembio');
-- -- ********** Error **********
-- -- ERROR: Operation not allowed: INSERT INTO Address
-- 
-- -- UPDATE freefall.Address SET address_ID = 5,
-- --  		   state = 'Italy',
-- --  		   city = 'Margherita'
-- -- WHERE address_ID = 4;
-- -- ********** Error **********
-- -- ERROR: Operation not allowed: UPDATE Address
-- 
-- -- DELETE FROM freefall.Address;
-- -- ********** Error **********
-- -- ERROR: Operation not allowed: DELETE FROM Address

----------------------
-- END CORE SECTION --
----------------------




---------------------
-- START UTILITIES --
---------------------

/******************/
/** EXTENSION #2 **/
/******************/
DROP FUNCTION IF EXISTS deactivate_contract_FNC(int);
-- FUNCTION: deactivate_contract_FNC(int)
---- DESCRIPTION: sets the contract's cellPhoneNumber_REF to NULL, so that new operations are prevented by the
----              'check_before_insert_into_call_table_TRG' and 'check_before_insert_into_message_table_TRG' before-triggers
---- in: contractID = the contract ID
---- out: resume = the partial information
---- USAGE: "SELECT deactivate_contract_FNC(6);"
CREATE OR REPLACE FUNCTION deactivate_contract_FNC(contractID int) RETURNS VOID AS
$$
	DECLARE numberREF int;

	BEGIN
		IF((SELECT contract_ID FROM freefall.Contract WHERE contract_ID = contractID) IS NOT NULL) THEN 		
			-- Remember the old favorite number REF
			SELECT cellPhoneNumber_REF INTO numberREF FROM freefall.Contract WHERE contract_ID = contractID;
		
			-- Set the cellphone number REF to NULL
			UPDATE freefall.Contract SET cellPhoneNumber_REF = NULL WHERE contract_ID = contractID;

			-- Make the cellphone number not assigned 
			UPDATE freefall.FreefallCellPhoneNumber SET assigned = FALSE WHERE freefallNumber_ID = numberREF;

			RAISE NOTICE '';
			RAISE NOTICE '----------------------------------';
			RAISE NOTICE 'Contract = % has been deactivated.', contractID;
			RAISE NOTICE '----------------------------------';
		ELSE
			RAISE NOTICE '';
			RAISE NOTICE '---------------------------------------------------';
			RAISE NOTICE 'Contract = % not found. Can''t deactivate contract.', contractID;
			RAISE NOTICE '---------------------------------------------------';
		END IF;
	END;
$$
LANGUAGE 'plpgsql';




/******************/
/** EXTENSION #3 **/
/******************/
DROP FUNCTION IF EXISTS support.get_resume_FNC(contractID int) CASCADE;
-- FUNCTION: get_resume_FNC(int)
---- DESCRIPTION: returns the basic information associated to the specified contract number
---- in: contractID = the contract ID
---- out: resume = the partial information
---- USAGE: "SELECT * FROM get_resume_FNC(6);"
CREATE FUNCTION support.get_resume_FNC(contractID int) RETURNS support.Resume_t AS
$$
	DECLARE resume support.Resume_t;
	
	DECLARE contract freefall.Contract;
	DECLARE customer freefall.Customer;
	DECLARE address freefall.ItalianAddress;
	DECLARE plan freefall.OrdinaryPlan;
	DECLARE freefallCellPhoneNumber freefall.CellPhoneNumber;
		
	BEGIN
		-- Get the contract object
		SELECT * INTO contract FROM freefall.Contract WHERE contract_ID = contractID;

		-- Get the contract's ID
		SELECT contract.contract_ID INTO resume.contractID; 

		IF(resume.contractID IS NOT NULL) THEN
			-- Get the customer object
			SELECT * INTO customer FROM freefall.Customer WHERE customer_ID = contract.customer_REF;
			
			-- Get the ordinary plan object
			SELECT * INTO plan FROM freefall.OrdinaryPlan WHERE ordinaryPlan_ID = contract.ordinaryPlan_REF;
			
			-- Get the customer's ID 
			SELECT customer.customer_ID INTO resume.customerID;
			
			-- Get the customer's name
			SELECT customer.name INTO resume.name;
			
			-- Get the customer's surname
			SELECT customer.surname INTO resume.surname;
			
			-- Get the customer's SSN
			SELECT customer.SSN INTO resume.SSN;
			
			-- Get the contract's Freefall number
			SELECT countryCode INTO resume.countryCode FROM freefall.CellPhoneNumber WHERE cellPhoneNumber_ID = contract.cellPhoneNumber_REF;
			SELECT operatorPrefix INTO resume.prefix FROM freefall.CellPhoneNumber WHERE cellPhoneNumber_ID = contract.cellPhoneNumber_REF;
			SELECT coreNumber INTO resume.coreNumber FROM freefall.CellPhoneNumber WHERE cellPhoneNumber_ID = contract.cellPhoneNumber_REF;
			
			-- Get the contract's activation date
			SELECT contract.stipulatedOn INTO resume.stipulatedOn;
			
			-- Ask how many operations the customer did perform
			SELECT COUNT(operation_ID) INTO resume.numOperations FROM freefall.Operation WHERE contract_REF = resume.contractID;
			
			RETURN resume;
		ELSE
			RAISE EXCEPTION 'Specified contract number is not valid: %', contractID;
		END IF;
	END
$$
LANGUAGE plpgsql;




DROP FUNCTION IF EXISTS support.get_resume_FNC(contractID int, mode text) CASCADE;
---- DESCRIPTION: returns an extended set of information associated the specified contract number
---- in: contractID = the contract ID
---- in mode = the mode level. It only admits 'EXTENDED'
---- out: resumeExtended = the complete information
---- USAGE: "SELECT * FROM get_resume_FNC(6, 'EXTENDED');"
CREATE FUNCTION support.get_resume_FNC(contractID int, mode text) RETURNS support.Resume_Extended_t AS
$$
	DECLARE resumeExtended support.Resume_Extended_t;

	DECLARE contract freefall.Contract;
	DECLARE customer freefall.Customer;
	DECLARE plan freefall.OrdinaryPlan;
	DECLARE payAndGo freefall.PayAndGoPricePlan;
	DECLARE payMonthly freefall.PayMonthlyPricePlan;
	DECLARE bankAccount freefall.ItalianBankAccount;
	DECLARE itIBAN freefall.ItalianIBAN;
	DECLARE promotion freefall.TemporaryPromotion;
		
	BEGIN
		IF(mode = 'EXTENDED') THEN
			-- Get the contract object
			SELECT * INTO contract FROM freefall.Contract WHERE contract_ID = contractID;
			
			-- Get the customer object
			SELECT * INTO customer FROM freefall.Customer WHERE customer_ID = contract.customer_REF;
			
			-- Get the ordinary plan object
			SELECT * INTO plan FROM freefall.OrdinaryPlan WHERE ordinaryPlan_ID = contract.ordinaryPlan_REF;
			
			-- Get the temporary promotion object
			SELECT * INTO promotion FROM freefall.TemporaryPromotion WHERE promotion_ID = contract.activePromotion_REF;

			-- Get the basic information anyway
			SELECT *
			INTO   resumeExtended.contractID,
			       resumeExtended.customerID,
			       resumeExtended.name,
			       resumeExtended.surname,
			       resumeExtended.SSN,
			       resumeExtended.countryCode,
			       resumeExtended.prefix,
			       resumeExtended.coreNumber,
			       resumeExtended.stipulatedOn,
			       resumeExtended.numOperations
			FROM support.get_resume_FNC(contractID);
			
			-- Ans if the customer ever had a promotion
			SELECT contract.hadFreePromotion INTO resumeExtended.hadFreePromotion;
			
			-- Get the promotion's expiration date
			SELECT promotion.validUntil INTO resumeExtended.promotionExpirationDate;
			
			-- Get the promotion's SMSs left
			SELECT promotion.freeSMSsLeft INTO resumeExtended.SMSsLeft;
			
			-- Get the promotion's seconds left
			SELECT promotion.freeSecondsLeft INTO resumeExtended.secondsLeft;
			
			-- Get the promotion's KBs left
			SELECT promotion.freeKBsLeft INTO resumeExtended.KBsLeft;

			-- If it's a 'PayandGoPricePlan'..
			IF(plan.planType = 'g') THEN
				-- Get the customer object
				SELECT * INTO payAndGo FROM freefall.PayAndGoPricePlan WHERE ordinaryPlan_ID = contract.ordinaryPlan_REF;
				
				-- Get the plan's balance
				SELECT payAndGo.balance INTO resumeExtended.balance;
				
				-- Ask if the customer wants bills
				SELECT payAndGo.wantsBill INTO resumeExtended.wantsBill;
				
			-- Else, if it's a 'PayMonthlyPricePlan'..
			ELSE
				-- Get the customer object
				SELECT * INTO payMonthly FROM freefall.PayMonthlyPricePlan WHERE ordinaryPlan_ID = contract.ordinaryPlan_REF;
				
				-- Get the bank account object
				SELECT * INTO bankAccount FROM freefall.ItalianBankAccount WHERE bankAccount_ID = payMonthly.bankDetails_REF;
				
				-- Get the italian IBAN object
				SELECT * INTO itIBAN FROM freefall.ItalianIBAN WHERE italianIBAN_ID = bankAccount.italianIBAN_REF;
				
				-- Ask if the customer ever had a discount
				SELECT payMonthly.hadDiscount INTO resumeExtended.hadDiscount;
				
				-- Get the customers bank account's balance
				SELECT bankAccount.accountBalance INTO resumeExtended.accountBalance;
				
				-- Get the customer bank account's IBAN
				SELECT itIBAN.stateCode || itIBAN.controlCode || itIBAN.CINCode || itIBAN.ABICode || itIBAN.CABCode || itIBAN.accountNumber INTO resumeExtended.IBAN FROM freefall.italianIBAN;
				
			END IF;

			RETURN resumeExtended;
			
		ELSE
			RAISE WARNING 'USAGE: ''mode'' must be equal to ''EXTENDED''.';
			RAISE WARNING 'CONTEXT: get_resume_FNC(contractID int8, mode text);';
			RAISE 'Unknown mode specified.';
		END IF;
	END
$$
LANGUAGE plpgsql;

-------------------
-- END UTILITIES --
-------------------




-------------------------
-- BEGIN POPULATING DB --
-------------------------

-- Populate the 'FreefallCellPhoneNumber' table by generating K Freefall random cellphone numbers to be assigned to new contracts
DELETE FROM freefall.FreefallCellPhoneNumber;
SELECT populate_freefall_cellphone_numbers_table_FNC(50, 'IT');

INSERT INTO freefall.ItalianIBAN VALUES(DEFAULT, 'IT', '37', 'A', '34220', '04188', '675509012433');
INSERT INTO freefall.ItalianIBAN VALUES(DEFAULT, 'IT', '37', 'V', '12465', '04190', '091010246343');
INSERT INTO freefall.ItalianIBAN VALUES(DEFAULT, 'IT', '37', 'H', '54008', '05194', '534884001997');
INSERT INTO freefall.ItalianIBAN VALUES(DEFAULT, 'IT', '37', 'D', '09219', '06195', '221242213768');
INSERT INTO freefall.ItalianIBAN VALUES(DEFAULT, 'IT', '37', 'R', '11561', '06199', '569115498110');

INSERT INTO freefall.ItalianBankAccount VALUES(DEFAULT,  1449.98, 2, 'EUR', DEFAULT);
INSERT INTO freefall.ItalianBankAccount VALUES(DEFAULT,    20.12, 1, 'EUR', DEFAULT);
INSERT INTO freefall.ItalianBankAccount VALUES(DEFAULT,   419.52, 3, 'EUR', DEFAULT);
INSERT INTO freefall.ItalianBankAccount VALUES(DEFAULT, 10345.00, 4, 'EUR', DEFAULT);
INSERT INTO freefall.ItalianBankAccount VALUES(DEFAULT,  2218.15, 5, 'EUR', DEFAULT);

INSERT INTO freefall.PayAndGoPricePlan VALUES(DEFAULT, 'g', 0.15, 0.30, 0.05, 0.10, 0.25, 1.3,  23.04, FALSE, DEFAULT);
INSERT INTO freefall.PayAndGoPricePlan VALUES(DEFAULT, 'g', 0.20, 0.25, 0.05, 0.10, 0.20, 1.25, 03.04, FALSE, DEFAULT);
INSERT INTO freefall.PayAndGoPricePlan VALUES(DEFAULT, 'g', 0.10, 0.25, 0.05, 0.15, 0.15, 1.4,  02.20,  TRUE, DEFAULT);
INSERT INTO freefall.PayMonthlyPricePlan VALUES(DEFAULT, 'm', 0.10, 0.30, 0.05, 0.10, 0.25,  1.2, 1, FALSE, DEFAULT);
INSERT INTO freefall.PayMonthlyPricePlan VALUES(DEFAULT, 'm', 0.15, 0.30, 0.05, 0.10, 0.25, 1.15, 2, FALSE, DEFAULT);
INSERT INTO freefall.PayMonthlyPricePlan VALUES(DEFAULT, 'm', 0.15, 0.30, 0.05, 0.10, 0.25, 1.25, 3, FALSE, DEFAULT);
 
INSERT INTO freefall.SpecialOffer VALUES(DEFAULT, 'now', 799.00, 699.00, 'Apple iPad 3G + Wi-Fi 64GB');
INSERT INTO freefall.SpecialOffer VALUES(DEFAULT, 'now', 249.00, 229.00, 'Freefall Internet Key Quad-Band LTE');
INSERT INTO freefall.SpecialOffer VALUES(DEFAULT, 'now',  99.00,  89.00, 'Freefall ''Amazing T-Shirt''');
 
INSERT INTO freefall.Customer VALUES(DEFAULT, 'WTRBSP60M23D643C', 'Walter', 'Bishop', ('Italy', 'Lodi', 'Via XX Settembre', 12, 26900), ARRAY[]::support.TelephoneNumber_t[]); -- No alternative telephone numbers
INSERT INTO freefall.Customer VALUES(DEFAULT, 'JHNVNM91M44F314G', 'John', 'Von Neumann', ('Italy', 'Cavenago', 'Via Liberazione', 15, 26824), ARRAY[('39', '320', '0499123'), ('39', '06', '5991112'), ('39', '331', '0023444')]::support.TelephoneNumber_t[], ARRAY[2]); -- A 'CellPhoneNumber' and a 'HomePhoneNumber'
INSERT INTO freefall.Customer VALUES(DEFAULT, 'ADALVC11F73U218H', 'Ada', 'Lovelace', ('Italy', 'Lodi', 'Via Agostino da Lodi', 23, 26900), ARRAY[('39', '320', '3310228')]::support.TelephoneNumber_t[], ARRAY[1]); -- A 'CellPhoneNumber'
INSERT INTO freefall.Customer VALUES(DEFAULT, 'DNSRTH50M90P119T', 'Dennis', 'Ritchie', ('Italy', 'Lodi', 'Via Benedetto Croce', 2, 26900), ARRAY[('39', '0881', '0118643')]::support.TelephoneNumber_t[], ARRAY[1]); -- A 'HomePhoneNumber'
INSERT INTO freefall.Customer VALUES(DEFAULT, 'CRLSGN17M33L993C', 'Carl', 'Sagan', ('Italy', 'San Martino in Strada', 'Via Madre Teresa di Calcutta', 12, 26817), ARRAY[('39', '320', '8556301'), ('39', '330', '0987654')]::support.TelephoneNumber_t[], ARRAY[2]); -- Two 'CellPhoneNumber's
INSERT INTO freefall.Customer VALUES(DEFAULT, 'ALNTNG12M78S013A', 'Alan', 'Turing', ('Italy', 'Cavenago', 'Viale Italia', 8, 26824), ARRAY[('39', '06', '7654321'), ('39', '02', '5522013')]::support.TelephoneNumber_t[], ARRAY[3]); -- Two 'HomePhoneNumber's
 
INSERT INTO freefall.TemporaryPromotion VALUES(DEFAULT, '2013-05-28 23:59:59.999', 10, 13, 5000, NULL);
INSERT INTO freefall.TemporaryPromotion VALUES(DEFAULT, '2013-06-30 23:59:59.999',  2, 20, 100,  NULL);
INSERT INTO freefall.TemporaryPromotion VALUES(DEFAULT, '2013-05-28 23:59:59.999',  5, 20, 0,    NULL);
INSERT INTO freefall.TemporaryPromotion VALUES(DEFAULT, '2013-06-28 23:59:59.999',  0,  2, 2048, NULL);

INSERT INTO freefall.Contract VALUES(DEFAULT, 1, 1, NULL, 'now',    4, FALSE); 
INSERT INTO freefall.Contract VALUES(DEFAULT, 2, 2, NULL, 'now',    2, FALSE);
INSERT INTO freefall.Contract VALUES(DEFAULT, 3, 3, NULL, 'now', NULL, FALSE);
INSERT INTO freefall.Contract VALUES(DEFAULT, 4, 4, NULL, 'now',    3, FALSE);
INSERT INTO freefall.Contract VALUES(DEFAULT, 5, 5, NULL, 'now',    1, FALSE);
INSERT INTO freefall.Contract VALUES(DEFAULT, 6, 6, NULL, 'now', NULL, FALSE);

UPDATE freefall.TemporaryPromotion SET favoriteNumber_REF = 1 WHERE promotion_ID = 1;
UPDATE freefall.TemporaryPromotion SET favoriteNumber_REF = 3 WHERE promotion_ID = 2;
UPDATE freefall.TemporaryPromotion SET favoriteNumber_REF = 2 WHERE Promotion_ID = 3;
UPDATE freefall.TemporaryPromotion SET favoriteNumber_REF = 4 WHERE promotion_ID = 4;

-- ********** Error **********
-- WARNING:  Source and Destination numbers cannot be equal: SKIPPING..

-- We used a COMPOSITE TYPE here for the receiver telephone number as opposed to an integer FOREIGN KEY to
-- (existing) telephone numbers essentially for two reasons:
-- 1. We do not want to limit a whatsoever unknown receiver number to an existing number into our tables,
--    nor we want to prior add them into our telephone number tables as a possible solution: this would
--    completely make no sense;
-- 2. This is a write-once-read-many operation; this means that - unlike with FKs - if a user changes his
--    telephone number, this would not generate inconsistencies, since the row is a unit of information itself.
--    To better explain this, suppose we have 2 contracts (C1 and C2) having, respectively, T1 and T2 cellphone
--    number. If we implement the solution explained in #1, we'd have both sources and destination numbers into
--    'CellPhoneNumber' table: no problems so far. Now suppose we have a row into 'Call' table where C1 calls T2.
--    What happens then if C2 is terminated by its owner? If we deactivate a contract, say T2, we set the
--    cellPhoneNumber_REF to NULL, but then what would T2 mean anymore into the 'Call' table? Using composite types,
--    instead, we can terminate as many contracts as we want, never generating inconsistencies, as the cellphone number
--    is hard-coded into the Operation's row.
/* operation_ID =  1 */ INSERT INTO    freefall.Call VALUES(DEFAULT, 4, '2012-04-12 19:32:45', ('39', '328', '1090339'),  TRUE, FALSE, NULL,   92, DEFAULT, ST_buffer(ST_GeomFromEWKT('srid=3857;POINT(1062797.439 5651851.323)'), 20));
/* operation_ID =  2 */ INSERT INTO    freefall.Call VALUES(DEFAULT, 2, '2012-04-19 01:34:36', ('39', '310', '1849183'),  TRUE, FALSE, NULL,   92, DEFAULT, ST_buffer(ST_GeomFromEWKT('srid=3857;POINT(1058993.332 5670600.830)'), 20)); 
/* operation_ID =  3 */ INSERT INTO freefall.Message VALUES(DEFAULT, 2, '2012-04-20 19:43:47', ('39', '313', '5627886'),  TRUE,  TRUE, NULL,  2600, DEFAULT, ST_buffer(ST_GeomFromEWKT('srid=3857;POINT(1057557.983 5670894.312)'), 20));
/* operation_ID =  4 */ INSERT INTO    freefall.Call VALUES(DEFAULT, 3, '2012-04-21 07:12:44', ('39', '330', '7708124'),  TRUE, FALSE, NULL,   11, DEFAULT, ST_buffer(ST_GeomFromEWKT('srid=3857;POINT(1058391.332 5670710.845)'), 20));
/* operation_ID =  5 */ INSERT INTO    freefall.Call VALUES(DEFAULT, 5, '2012-04-21 11:34:36', ('39', '339', '3090554'),  TRUE, FALSE, NULL,   92, DEFAULT, ST_buffer(ST_GeomFromEWKT('srid=3857;POINT(1057016.045 5663295.371)'), 20));
/* operation_ID =  6 */ INSERT INTO freefall.Message VALUES(DEFAULT, 6, '2012-04-22 17:56:00', ('39', '320', '9088712'), FALSE, FALSE, NULL,    4, DEFAULT, ST_buffer(ST_GeomFromEWKT('srid=3857;POINT(1046798.177 5673429.402)'), 20)); -- SMS
/* operation_ID =  7 */ INSERT INTO freefall.Message VALUES(DEFAULT, 6, '2012-04-23 13:11:31', ('39', '329', '1238875'), FALSE, FALSE, NULL,   20, DEFAULT, ST_buffer(ST_GeomFromEWKT('srid=3857;POINT(1058469.198 5668732.704)'), 20)); -- SMS
/* operation_ID =  8 */ INSERT INTO    freefall.Call VALUES(DEFAULT, 6, '2012-04-23 13:38:11', ('39', '339', '3233871'), FALSE, FALSE, NULL,  220, DEFAULT, ST_buffer(ST_GeomFromEWKT('srid=3857;POINT(1056182.229 5663184.882)'), 20));
/* operation_ID =  9 */ INSERT INTO    freefall.Call VALUES(DEFAULT, 3, '2012-04-23 15:44:03', ('39', '334', '4981331'), FALSE,  TRUE, NULL,  138, DEFAULT, ST_buffer(ST_GeomFromEWKT('srid=3857;POINT(1097927.673 5639060.189)'), 20));
/* operation_ID = 10 */ INSERT INTO freefall.Message VALUES(DEFAULT, 6, '2012-04-23 16:22:58', ('39', '337', '8729970'), FALSE,  TRUE, NULL,    9, DEFAULT, ST_buffer(ST_GeomFromEWKT('srid=3857;POINT(1047128.072 5674304.326)'), 20)); -- SMS
/* operation_ID = 11 */ INSERT INTO    freefall.Call VALUES(DEFAULT, 4, '2012-04-23 16:33:36', ('39', '340', '4056554'),  TRUE, FALSE, NULL,   92, DEFAULT, ST_buffer(ST_GeomFromEWKT('srid=3857;POINT(1063159.135 5651168.502)'), 20));
/* operation_ID = 12 */ INSERT INTO    freefall.Call VALUES(DEFAULT, 4, '2012-04-23 18:01:26', ('39', '333', '5708200'),  TRUE,  TRUE, NULL, 2350, DEFAULT, ST_buffer(ST_GeomFromEWKT('srid=3857;POINT(1065696.661 5655135.667)'), 20));
/* operation_ID = 13 */ INSERT INTO freefall.Message VALUES(DEFAULT, 5, '2012-04-23 20:55:46', ('39', '338', '4555892'),  TRUE,  TRUE, NULL, 8192, DEFAULT, ST_buffer(ST_GeomFromEWKT('srid=3857;POINT(1048819.980 5680546.681)'), 20));
/* operation_ID = 14 */ INSERT INTO freefall.Message VALUES(DEFAULT, 5, '2012-04-23 20:59:45', ('39', '315', '9442326'),  TRUE,  TRUE, NULL,  692, DEFAULT, ST_buffer(ST_GeomFromEWKT('srid=3857;POINT(1045893.381 5680789.834)'), 20)); -- MMS towards favorite number: gives NOTICE: Enough free SMSs left: nothing to be paid.
/* operation_ID = 15 */ INSERT INTO    freefall.Call VALUES(DEFAULT, 3, '2012-04-23 22:02:24', ('39', '333', '7458550'),  TRUE, FALSE, NULL,   11, DEFAULT, ST_buffer(ST_GeomFromEWKT('srid=3857;POINT(1057284.825 5670833.748)'), 20));
/*********************/ INSERT INTO    freefall.Call VALUES(DEFAULT, 2, '2012-04-24 21:40:12', ('39', '399', '9088712'), FALSE, FALSE, NULL,   26, DEFAULT, ST_buffer(ST_GeomFromEWKT('srid=3857;POINT(1057294.272 5670941.480)'), 20)); -- Gives WARNING: Source and Destination numbers cannot be equal: SKIPPING..
/* operation_ID = 17 */ INSERT INTO    freefall.Call VALUES(DEFAULT, 2, '2012-04-26 12:58:12', ('39', '338', '4555892'), FALSE,  TRUE, NULL,   28, DEFAULT, ST_buffer(ST_GeomFromEWKT('srid=3857;POINT(1060630.034 5664362.690)'), 20));
/* operation_ID = 18 */ INSERT INTO    freefall.Call VALUES(DEFAULT, 2, '2012-04-27 18:19:24', ('39', '040', '8876256'),  TRUE, FALSE, NULL,  115, DEFAULT, ST_buffer(ST_GeomFromEWKT('srid=3857;POINT(1057643.405 5662624.371)'), 20));
/* operation_ID = 19 */ INSERT INTO freefall.Message VALUES(DEFAULT, 5, '2012-04-29 14:19:38', ('39', '315', '9442326'),  TRUE,  TRUE, NULL, 2404, DEFAULT, ST_buffer(ST_GeomFromEWKT('srid=3857;POINT(1068749.249 5666142.896)'), 20)); -- MMS towards favorite number: gives NOTICE: Enough free SMSs left: nothing to be paid.

	UPDATE freefall.PayAndGoPricePlan SET balance = balance +  30 WHERE ordinaryPlan_ID = 1;
	UPDATE freefall.PayAndGoPricePlan SET balance = balance + 250 WHERE ordinaryPlan_ID = 2;
 
/* operation_ID = 20 */ INSERT INTO    freefall.Call VALUES(DEFAULT, 2, '2012-05-01 11:42:20', ('39', '339', '4091220'),  TRUE,  TRUE, NULL, 4800, DEFAULT, ST_buffer(ST_GeomFromEWKT('srid=3857;POINT(1086596.583 5642699.946)'), 20)); 
/* operation_ID = 21 */ INSERT INTO    freefall.Call VALUES(DEFAULT, 4, '2012-05-01 16:56:39', ('39', '340', '1056554'),  TRUE,  TRUE, NULL, 3925, DEFAULT, ST_buffer(ST_GeomFromEWKT('srid=3857;POINT(1067848.339 5657509.310)'), 20));
/* operation_ID = 22 */ INSERT INTO    freefall.Call VALUES(DEFAULT, 6, '2012-05-01 18:47:56', ('39', '040', '6100244'), FALSE, FALSE, NULL,   31, DEFAULT, ST_buffer(ST_GeomFromEWKT('srid=3857;POINT(1061801.381 5659750.491)'), 20));
/* operation_ID = 23 */ INSERT INTO    freefall.Call VALUES(DEFAULT, 3, '2012-05-02 15:21:03', ('39', '335', '8091574'), FALSE,  TRUE, NULL,  118, DEFAULT, ST_buffer(ST_GeomFromEWKT('srid=3857;POINT(1078828.496 5656154.495)'), 20));
/* operation_ID = 24 */ INSERT INTO    freefall.Call VALUES(DEFAULT, 4, '2012-05-02 19:23:11', ('39', '340', '2056554'),  TRUE, FALSE, NULL, 1992, DEFAULT, ST_buffer(ST_GeomFromEWKT('srid=3857;POINT(1050101.593 5686557.006)'), 20));
/*********************/ INSERT INTO    freefall.Call VALUES(DEFAULT, 2, '2012-05-02 23:12:29', ('39', '339', '4091220'),  TRUE,  TRUE, NULL, 2200, DEFAULT, ST_buffer(ST_GeomFromEWKT('srid=3857;POINT(1085943.143 5642467.168)'), 20)); -- WARNING:  Couldn't complete the operation. Your balance is less than 0 €: SKIPPING..
/* operation_ID = 26 */ INSERT INTO    freefall.Call VALUES(DEFAULT, 3, '2012-05-03 15:44:13', ('39', '333', '4330210'), FALSE,  TRUE, NULL,   18, DEFAULT, ST_buffer(ST_GeomFromEWKT('srid=3857;POINT(1055352.319 5658955.243)'), 20)); -- Gives WARNING: Prefix is not valid: SKIPPING..
/* operation_ID = 27 */ INSERT INTO    freefall.Call VALUES(DEFAULT, 4, '2012-05-03 19:33:34', ('39', '340', '4056554'),  TRUE,  TRUE, NULL, 4300, DEFAULT, ST_buffer(ST_GeomFromEWKT('srid=3857;POINT(1074172.839 5650327.067)'), 20));
/* operation_ID = 28 */ INSERT INTO freefall.Message VALUES(DEFAULT, 4, '2012-05-04 07:21:09', ('39', '336', '3090554'),  TRUE, FALSE, NULL,  7796, DEFAULT, ST_buffer(ST_GeomFromEWKT('srid=3857;POINT(1049801.450 5686265.742)'), 20));
/* operation_ID = 29 */ INSERT INTO    freefall.Call VALUES(DEFAULT, 2, '2012-05-04 10:15:01', ('39', '339', '4091220'),  TRUE,  TRUE, NULL,  2800, DEFAULT, ST_buffer(ST_GeomFromEWKT('srid=3857;POINT(1081547.934 5642649.497)'), 20));
/* operation_ID = 30 */ INSERT INTO    freefall.Call VALUES(DEFAULT, 2, '2012-05-05 15:09:05', ('39', '339', '4091220'),  TRUE,  TRUE, NULL,  3000, DEFAULT, ST_buffer(ST_GeomFromEWKT('srid=3857;POINT(1082373.023 5643235.921)'), 20)); 
/* operation_ID = 31 */ INSERT INTO freefall.Message VALUES(DEFAULT, 4, '2012-05-05 17:11:34', ('39', '336', '3090554'),  TRUE, FALSE, NULL,  4796, DEFAULT, ST_buffer(ST_GeomFromEWKT('srid=3857;POINT(1049529.319 5686861.986)'), 20)); 
/* operation_ID = 32 */ INSERT INTO freefall.Message VALUES(DEFAULT, 4, '2012-05-06 17:15:40', ('39', '336', '3090554'),  TRUE,  TRUE, NULL, 19150, DEFAULT, ST_buffer(ST_GeomFromEWKT('srid=3857;POINT(1065700.305 5661904.216)'), 20));
/* operation_ID = 33 */ INSERT INTO    freefall.Call VALUES(DEFAULT, 2, '2012-05-08 19:55:03', ('39', '339', '4091220'),  TRUE,  TRUE, NULL,  3400, DEFAULT, ST_buffer(ST_GeomFromEWKT('srid=3857;POINT(1079220.365 5647957.293)'), 20)); 
/* operation_ID = 34 */ INSERT INTO freefall.Message VALUES(DEFAULT, 4, '2012-05-09 12:09:00', ('39', '336', '3090554'),  TRUE,  TRUE, NULL, 38350, DEFAULT, ST_buffer(ST_GeomFromEWKT('srid=3857;POINT(1064389.657 5646019.358)'), 20));
/* operation_ID = 35 */ INSERT INTO freefall.Message VALUES(DEFAULT, 4, '2012-05-10 00:12:02', ('39', '336', '3090554'),  TRUE,  TRUE, NULL, 48350, DEFAULT, ST_buffer(ST_GeomFromEWKT('srid=3857;POINT(1063656.105 5646414.926)'), 20));
/* operation_ID = 36 */ INSERT INTO    freefall.Call VALUES(DEFAULT, 2, '2012-05-10 02:34:40', ('39', '339', '4091220'),  TRUE,  TRUE, NULL,  2600, DEFAULT, ST_buffer(ST_GeomFromEWKT('srid=3857;POINT(1080711.900 5647940.709)'), 20));
/* operation_ID = 37 */ INSERT INTO freefall.Message VALUES(DEFAULT, 4, '2012-05-11 02:26:29', ('39', '336', '3090554'),  TRUE,  TRUE, NULL, 68350, DEFAULT, ST_buffer(ST_GeomFromEWKT('srid=3857;POINT(1068134.922 5645900.457)'), 20)); -- Gives NOTICE: NEW DISCOUNT APLLIED.
/* operation_ID = 38 */ INSERT INTO    freefall.Call VALUES(DEFAULT, 2, '2012-05-11 12:22:23', ('39', '339', '4091220'),  TRUE,  TRUE, NULL,  3800, DEFAULT, ST_buffer(ST_GeomFromEWKT('srid=3857;POINT(1080037.306 5646745.006)'), 20)); -- Gives NOTICE: NEW PROMOTION ACTIVATED.
/* operation_ID = 39 */ INSERT INTO freefall.Message VALUES(DEFAULT, 4, '2012-05-12 17:20:32', ('39', '336', '3090554'),  TRUE,  TRUE, NULL, 19120, DEFAULT, ST_buffer(ST_GeomFromEWKT('srid=3857;POINT(1072622.531 5645077.439)'), 20));
/* operation_ID = 40 */ INSERT INTO    freefall.Call VALUES(DEFAULT, 2, '2012-05-14 17:11:23', ('39', '339', '4091220'),  TRUE,  TRUE, NULL,  4400, DEFAULT, ST_buffer(ST_GeomFromEWKT('srid=3857;POINT(1081199.153 5646762.197)'), 20));
/* operation_ID = 41 */ INSERT INTO freefall.Message VALUES(DEFAULT, 4, '2012-05-14 17:57:00', ('39', '336', '3090554'),  TRUE,  TRUE, NULL,  8070, DEFAULT, ST_buffer(ST_GeomFromEWKT('srid=3857;POINT(1077593.576 5639131.112)'), 20));
/* operation_ID = 42 */ INSERT INTO    freefall.Call VALUES(DEFAULT, 2, '2012-05-15 01:01:45', ('39', '339', '4091220'),  TRUE,  TRUE, NULL,  4500, DEFAULT, ST_buffer(ST_GeomFromEWKT('srid=3857;POINT(1073751.530 5649917.449)'), 20));
/* operation_ID = 43 */ INSERT INTO    freefall.Call VALUES(DEFAULT, 2, '2012-05-15 07:31:15', ('39', '328', '2710144'),  TRUE,  TRUE, NULL,   500, DEFAULT, ST_buffer(ST_GeomFromEWKT('srid=3857;POINT(1074220.504 5651484.713)'), 20));
/* operation_ID = 44 */ INSERT INTO freefall.Message VALUES(DEFAULT, 3, '2012-05-15 12:07:28', ('39', '310', '4211974'),  TRUE,  TRUE, NULL,  2200, DEFAULT, ST_buffer(ST_GeomFromEWKT('srid=3857;POINT(1057978.834 5669668.929)'), 20));
/* operation_ID = 45 */ INSERT INTO freefall.Message VALUES(DEFAULT, 4, '2012-05-15 15:21:21', ('39', '336', '3090554'),  TRUE,  TRUE, NULL, 78350, DEFAULT, ST_buffer(ST_GeomFromEWKT('srid=3857;POINT(1066063.160 5655377.448)'), 20));
/* operation_ID = 46 */ INSERT INTO freefall.Message VALUES(DEFAULT, 4, '2012-05-15 17:56:24', ('39', '336', '3090554'),  TRUE,  TRUE, NULL, 28350, DEFAULT, ST_buffer(ST_GeomFromEWKT('srid=3857;POINT(1065153.393 5655392.837)'), 20));
/* operation_ID = 47 */ INSERT INTO freefall.Message VALUES(DEFAULT, 4, '2012-05-15 19:00:11', ('39', '336', '3090554'),  TRUE,  TRUE, NULL, 17220, DEFAULT, ST_buffer(ST_GeomFromEWKT('srid=3857;POINT(1079038.289 5655763.370)'), 20));
/*********************/ INSERT INTO freefall.Message VALUES(DEFAULT, 4, '2012-05-16 12:09:08', ('39', '399', '3310228'), FALSE, FALSE, NULL,    80, DEFAULT, ST_buffer(ST_GeomFromEWKT('srid=3857;POINT(1070628.084 5653482.723)'), 20)); -- Gives WARNING: Prefix is not valid: SKIPPING..
/* operation_ID = 49 */ INSERT INTO    freefall.Call VALUES(DEFAULT, 2, '2012-05-16 20:33:32', ('39', '313', '5627886'),  TRUE,  TRUE, NULL,  6000, DEFAULT, ST_buffer(ST_GeomFromEWKT('srid=3857;POINT(1074711.196 5649429.668)'), 20));
/* operation_ID = 50 */ INSERT INTO freefall.Message VALUES(DEFAULT, 4, '2012-05-17 20:48:35', ('39', '336', '3090554'),  TRUE,  TRUE, NULL, 18200, DEFAULT, ST_buffer(ST_GeomFromEWKT('srid=3857;POINT(1056779.210 5669203.634)'), 20));
/* operation_ID = 51 */ INSERT INTO freefall.Message VALUES(DEFAULT, 4, '2012-05-18 22:41:12', ('39', '336', '2212085'),  TRUE,  TRUE, NULL, 19400, DEFAULT, ST_buffer(ST_GeomFromEWKT('srid=3857;POINT(1058539.801 5670290.557)'), 20));
/*********************/ INSERT INTO    freefall.Call VALUES(DEFAULT, 2, '2012-05-22 20:41:12', ('39', '331', '1209260'),  TRUE, FALSE, NULL,   600, DEFAULT, ST_buffer(ST_GeomFromEWKT('srid=3857;POINT(1064391.341 5641430.721)'), 20)); -- Gives WARNING:  Couldn't complete the operation. Your balance = -33.00 is less than 0.2 €: SKIPPING..
/*********************/ INSERT INTO freefall.Message VALUES(DEFAULT, 3, '2012-06-01 05:36:21', ('39', '313', '5710144'),  TRUE,  TRUE, NULL,  2300, DEFAULT, ST_buffer(ST_GeomFromEWKT('srid=3857;POINT(1058481.981 5671212.970)'), 20)); -- Gives WARNING:  Couldn't complete the operation. Your balance = -0.78 is less than 0.2 €: SKIPPING..

	UPDATE freefall.PayAndGoPricePlan SET balance = balance + 50 WHERE ordinaryPlan_ID = 3;

/* operation_ID = 54 */ INSERT INTO freefall.Message VALUES(DEFAULT, 4, '2012-06-01 05:46:21', ('39', '313', '5710144'),  TRUE,  TRUE, NULL, 2300, DEFAULT, ST_buffer(ST_GeomFromEWKT('srid=3857;POINT(1058481.981 5671212.970)'), 20)); 

	UPDATE freefall.PayAndGoPricePlan SET balance = balance + 80 WHERE ordinaryPlan_ID = 2;

/* operation_ID = 55 */ INSERT INTO freefall.Message VALUES(DEFAULT, 3, '2012-06-01 23:30:56', ('39', '328', '1710144'),  TRUE,  TRUE, NULL,  2048, DEFAULT, ST_buffer(ST_GeomFromEWKT('srid=3857;POINT(1069902.329 5658781.344)'), 20)); -- Gives WARNING: Couldn't complete the operation. Your balance is less than 0.2 €: SKIPPING.. 
/* operation_ID = 56 */ INSERT INTO freefall.Message VALUES(DEFAULT, 2, '2012-06-06 05:39:11', ('39', '313', '5627886'),  TRUE,  TRUE, NULL,  2548, DEFAULT, ST_buffer(ST_GeomFromEWKT('srid=3857;POINT(1056913.046 5678293.513)'), 20));
/* operation_ID = 57 */ INSERT INTO freefall.Message VALUES(DEFAULT, 2, '2012-06-07 01:01:36', ('39', '313', '5627886'), FALSE,  TRUE, NULL,    28, DEFAULT, ST_buffer(ST_GeomFromEWKT('srid=3857;POINT(1057759.291 5670560.629)'), 20)); -- SMS
/* operation_ID = 58 */ INSERT INTO freefall.Message VALUES(DEFAULT, 2, '2012-06-10 15:30:13', ('39', '339', '3233879'), FALSE, FALSE, NULL,    24, DEFAULT, ST_buffer(ST_GeomFromEWKT('srid=3857;POINT(1066110.125 5677226.439)'), 20)); -- SMS
/*********************/ INSERT INTO freefall.Message VALUES(DEFAULT, 9, '2012-07-01 12:14:22', ('39', '336', '3090554'),  TRUE,  TRUE, NULL, 15350, DEFAULT, ST_buffer(ST_GeomFromEWKT('srid=3857;POINT(1058086.192 5671745.950)'), 20)); -- Gives ERROR: INSERT or update on table "message" violates foreign key constraint. contract_REF = 9 is not present in table "contract"

--------------------
-- END POPULATING --
--------------------




-------------------------
-- BEGIN MISCELLANEOUS --
-------------------------

-- We can ask for basic information about a contract
-- SELECT * FROM support.get_resume_FNC(4);

-- We can ask for extended information too
-- SELECT * FROM support.get_resume_FNC(4, 'EXTENDED');

-- We can register some errors for certain bills
SELECT register_error_FNC(4, 'Customer complains that durations of some calls are too high.');
-- --      RETURNS:
-- --      ---------------------------------------
-- --      error_ID = 1 registered to bill_ID = 4.
-- --      DESCRIPTION: 'Customer complains that durations of some calls are too high.'
-- --      ---------------------------------------
SELECT register_error_FNC(1, 'Customer complains that the address on his bill is not up to date.');
-- --      RETURNS:
-- --      ---------------------------------------
-- --      error_ID = 2 registered to bill_ID = 1.
-- --      DESCRIPTION: 'Customer complains that the address on his bill is not up to date.'
-- --      ---------------------------------------

-- We can try to register an error on a non-existing bill
SELECT register_error_FNC(11, 'Customer complains that the address on his bill is not up to date.');
-- --      RETURNS:
-- --      ------------------------------------------
-- --      bill_ID = 11 not found. Error not created.
-- --      ------------------------------------------

-- We can unregister an error associated to a bill
SELECT unregister_error_FNC(1);
-- --      RETURNS:
-- --      -------------------------------------------
-- --      error_ID = 1 unregistered from bill_ID = 4.
-- --      -------------------------------------------

-- We can try to unregister a non-existing error
SELECT unregister_error_FNC(12);
-- --      RETURNS:
-- --      -----------------------------------------------
-- --      error_ID = 12 not found. Can't unregister error.
-- --      -----------------------------------------------

-- We can deactivate a contract
SELECT deactivate_contract_FNC(5);
-- --      RETURNS:
-- --      ----------------------------------
-- --      Contract = 5 has been deactivated.
-- --      ----------------------------------

-- We can try to perform an operation from a deactivated contract
/*********************/ INSERT INTO freefall.Message VALUES(DEFAULT, 5, '2012-08-01 15:10:33', ('39', '315', '9442326'), FALSE, FALSE, NULL, 24, DEFAULT, ST_buffer(ST_GeomFromEWKT('srid=3857;POINT(1055220.125 5651236.439)'), 20)); -- This is gonna fail, since contract = 5 has been just deactivated
-- --      RETURNS:
-- --	   ---------------------------------------------------------
-- --      Contract = 5 is no more active. Can't perform operations.
-- --      ---------------------------------------------------------

-----------------------
-- END MISCELLANEOUS --
-----------------------




-------------------
-- BEGIN QUERIES --
-------------------

--------------------
-- ACTIVITY 5.3.a --
--------------------
-- SELECT * FROM get_customer_names_by_XYZ_FNC('2012-05-15', -10, 1500);
-- --      RETURNS:
-- --      ERROR: Value of Y must be at least 0 in 'getCustomerNamesByXYZ_f(X, Y, Z)' function

-- SELECT * FROM get_customer_names_by_XYZ_FNC('2012-05-15', 10, -1500);
-- --      RETURNS:
-- --      ERROR: Value of Z must be at least 1 in 'getCustomerNamesByXYZ_f(X, Y, Z)' function

-- SELECT * FROM get_customer_names_by_XYZ_FNC('2012-05-03', 0, 18500);
-- --      RETURNS:
-- --      Ada | Lovelace | 26 | 2012-05-03 | 18500 | 18357.90

-- SELECT * FROM get_customer_names_by_XYZ_FNC('2012-05-15', 10, 1500);
-- --      RETURNS:
-- --      /

-- SELECT * FROM get_customer_names_by_XYZ_FNC('2012-05-15', 1, 150000); -- Gets ALL the operations made on day X in the whole province
-- --      RETURNS:
-- --      Ada    | Lovelace    | 44 | 2012-05-15 | 150000 |  1382.29
-- --      Dennis | Ritchie     | 46 | 2012-05-15 | 150000 | 17304.06
-- --      Dennis | Ritchie     | 45 | 2012-05-15 | 150000 | 17726.05
-- --      Jogn   | Von Neumann | 43 | 2012-05-15 | 150000 | 25561.38
-- --      Dennis | Ritchie     | 47 | 2012-05-15 | 150000 | 26195.41
-- --      John   | Von Neumann | 42 | 2012-05-15 | 150000 | 26493.36

-- SELECT * FROM get_customer_names_by_XYZ_FNC('2012-04-23', 0, 8000);
-- --      RETURNS:
-- --      Ada  | Lovelace    | 15 | 2012-04-23 | 8000 |  480.61
-- --      Alan | Turing      |  7 | 2012-04-23 | 8000 | 2410.07
-- --      Alan | Turing      |  8 | 2012-04-23 | 8000 | 7998.26


-- SELECT * FROM get_customer_names_by_XYZ_FNC('2012-04-23', 1, 16000);
-- --      RETURNS:
-- --      Ada    | Lovelace    | 15 | 2012-04-23 | 16000 |   480.61
-- --      Alan   | Turing      | 7  | 2012-04-23 | 16000 |  2410.07
-- --      Alan   | Turing      | 8  | 2012-04-23 | 16000 |  7998.26
-- --      Alan   | Turing      | 10 | 2012-04-23 | 16000 | 11072.30
-- --      Carl   | Sagan       | 13 | 2012-04-23 | 16000 | 12999.23
-- --      Carl   | Sagan       | 14 | 2012-04-23 | 16000 | 15307.28



--------------------
-- ACTIVITY 5.3.b --
--------------------
-- SELECT * FROM get_top_K_cities_FNC(10);
-- --      RETURNS:
-- --      98031 | Lodi               | 10
-- --      98010 | Casalpusterlengo   | 4
-- --      98019 | Codogno            | 4
-- --      98006 | Brembio            | 3
-- --      98037 | Massalengo         | 3
-- --      98061 | Zelo Buon Persico  | 3
-- --      98014 | Castiglione d'Adda | 2
-- --      98022 | Corno Giovine      | 2
-- --      98030 | Livraga            | 2
-- --      98042 | Orio Litta         | 2



--------------------
-- ACTIVITY 5.3.c --
--------------------
-- SELECT * FROM create_customer_path_FNC(4);
-- --      RETURNS:
-- --      /



--------------------
-- ACTIVITY 5.3.d --
--------------------
-- SELECT * FROM show_operations_in_cities_with_wide_green_areas_FNC();
-- --      RETURNS:
-- --      98031 | Lodi                     | 10
-- --      98010 | Casalpusterlengo         | 4
-- --      98019 | Codogno                  | 4
-- --      98006 | Brembio                  | 3
-- --      98014 | Castiglione d'Adda       | 2
-- --      98056 | Tavazzano con Villavesco | 2
-- --      98017 | Cavenago d'Adda          | 1
-- --      98025 | Crespiatica              | 1
-- --      98034 | Mairago                  | 1
-- --      98044 | Ossago Lodigiano         | 1
-- --      98048 | San Martino in Strada    | 1
-- --      98052 | Secugnago                | 1
-- --      98054 | Somaglia                 | 1
-- --      98058 | Turano Lodigiano         | 1



--------------------
-- ACTIVITY 5.3.e --
--------------------
-- SELECT * FROM get_top_customers_in_province_FNC();
-- --      RETURNS:
-- --      4 | Dennis | Ritchie     | 12
-- --      2 | John   | Von Neumann | 9
-- --      3 | Ada    | Lovelace    | 5
-- --      5 | Carl   | Sagan       | 4
-- --      6 | Alan   | Turing      | 4

-----------------
-- END QUERIES --
-----------------