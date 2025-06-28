--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.9) ~  Much Love, Ferib 

]]--

bit32 = {};
local N = 32;
local P = 2 ^ N;
bit32.bnot = function(x)
	x = x % P;
	return (P - 1) - x;
end;
bit32.band = function(x, y)
	if (y == 255) then
		return x % 256;
	end
	if (y == 65535) then
		return x % 65536;
	end
	if (y == 4294967295) then
		return x % 4294967296;
	end
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 2) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.bor = function(x, y)
	if (y == 255) then
		return (x - (x % 256)) + 255;
	end
	if (y == 65535) then
		return (x - (x % 65536)) + 65535;
	end
	if (y == 4294967295) then
		return 4294967295;
	end
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) >= 1) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.bxor = function(x, y)
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 1) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.lshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount < 0) then
		return math.floor(x * (2 ^ s_amount));
	else
		return (x * (2 ^ s_amount)) % P;
	end
end;
bit32.rshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount > 0) then
		return math.floor(x * (2 ^ -s_amount));
	else
		return (x * (2 ^ -s_amount)) % P;
	end
end;
bit32.arshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount > 0) then
		local add = 0;
		if (x >= (P / 2)) then
			add = P - (2 ^ (N - s_amount));
		end
		return math.floor(x * (2 ^ -s_amount)) + add;
	else
		return (x * (2 ^ -s_amount)) % P;
	end
end;
local obf_stringchar = string.char;
local obf_stringbyte = string.byte;
local obf_stringsub = string.sub;
local obf_bitlib = bit32 or bit;
local obf_XOR = obf_bitlib.bxor;
local obf_tableconcat = table.concat;
local obf_tableinsert = table.insert;
local function LUAOBFUSACTOR_DECRYPT_STR_0(LUAOBFUSACTOR_STR, LUAOBFUSACTOR_KEY)
	local result = {};
	_G.Cs = {UQSDDAA=3,YASDMRXA=1,YASa0AVV=2};
	for i = 1, #LUAOBFUSACTOR_STR do
		obf_tableinsert(result, obf_stringchar(obf_XOR(obf_stringbyte(obf_stringsub(LUAOBFUSACTOR_STR, i, i + #Cs + 1)), obf_stringbyte(obf_stringsub(LUAOBFUSACTOR_KEY, 1 + (i % #LUAOBFUSACTOR_KEY), 1 + (i % #LUAOBFUSACTOR_KEY) + 1))) % 256));
	end
	return obf_tableconcat(result);
end
local v0 = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\227\198\203\41\239\184\198\10\212\199\232\49\233\169\198\25\212", "\126\177\163\187\69\134\219\167")):WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\4\216\36\246\229\48\217\47\200", "\156\67\173\74\165")):WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\19\162\71\50\189\50\71", "\38\84\215\41\118\220\70"));
local v1 = {LUAOBFUSACTOR_DECRYPT_STR_0("\113\33\18", "\158\48\118\66\114"),LUAOBFUSACTOR_DECRYPT_STR_0("\137\37\9\57\125\160\239", "\155\203\68\112\86\19\197"),LUAOBFUSACTOR_DECRYPT_STR_0("\101\207\57\239\83\122\234\239", "\152\38\189\86\156\32\24\133"),LUAOBFUSACTOR_DECRYPT_STR_0("\219\4\148\97\173", "\38\156\55\199"),LUAOBFUSACTOR_DECRYPT_STR_0("\131\124\110\113\75\127", "\35\200\29\28\72\115\20\154"),LUAOBFUSACTOR_DECRYPT_STR_0("\43\237\252\246", "\84\121\223\177\191\237\76"),LUAOBFUSACTOR_DECRYPT_STR_0("\136\101\238\240\98", "\161\219\54\169\192\90\48\80")};
for v2, v3 in ipairs(v1) do
	local v4 = (0 + 0) - (791 - (368 + 423));
	local v5;
	local v6;
	while true do
		if (v4 == ((1272 - (945 + 326)) + (0 - 0))) then
			while true do
				if (v5 == ((715 - (553 - (10 + 8))) - (((3919 - 2900) - ((1244 - (416 + 26)) + 150)) + (1613 - (1408 + 92))))) then
					v6 = v0:FindFirstChild(v3);
					if (v6 and v6:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\100\77\4\48\69\71\51\38\91\75\16\49", "\69\41\34\96"))) then
						local v12 = (0 - 0) - 0;
						local v13;
						local v14;
						local v15;
						while true do
							if (v12 == (1087 - (461 + 625))) then
								v15 = nil;
								while true do
									if (v13 == ((2 + 2) - (3 - 1))) then
										local v18 = 1288 - (993 + 295);
										local v19;
										while true do
											if (v18 == (438 - (145 + 293))) then
												v19 = (0 - (430 - (44 + 386))) + (1486 - (998 + 488)) + (1171 - (418 + 753));
												while true do
													if (v19 == (1 + 0)) then
														v15.ReloadTime = ((103.00999999999999 + 894) - (268 + 647 + 82)) - ((0 + 0) - (772 - (201 + 571)));
														v13 = ((1695 - (116 + 1022)) + (1656 - 1258)) - (((619 + 435) - (919 - 667)) + ((2659 - (1249 + 73)) - (382 + 687 + 118)));
														break;
													end
													if ((((1145 - (466 + 679)) - (0 - 0)) - ((0 - 0) - (1900 - (106 + 1794)))) == v19) then
														local v35 = 0 + 0;
														local v36;
														while true do
															if (v35 == (859 - (814 + 45))) then
																v36 = (0 - 0) + (0 - 0);
																while true do
																	if (v36 == (0 + 0)) then
																		local v46 = 0 + 0;
																		while true do
																			if (v46 == (885 - (261 + 624))) then
																				v15.Spread = ((584 - (57 + 527)) - (1427 - (41 + 1386))) - ((0 - 0) + 0 + 0);
																				v15.FireRate = (0.05 - 0) + ((1871 - (1020 + 60)) - ((1791 - (630 + 793)) + (1433 - 1010)));
																				v46 = 2 - 1;
																			end
																			if (v46 == (4 - 3)) then
																				v36 = (2 + 1) - (6 - 4);
																				break;
																			end
																		end
																	end
																	if (v36 == ((1766 - (760 + 987)) - (10 + (1921 - (1789 + 124))))) then
																		v19 = ((4604 - (745 + 21)) - (9421 - 6581)) - (((1104 + 253) - (144 + 272 + (71 - 45))) + ((1023 - 762) - (2 + 177)));
																		break;
																	end
																end
																break;
															end
														end
													end
												end
												break;
											end
										end
									end
									if (v13 == (((65 - (30 + 35)) + 0 + 0) - (0 - (1055 - (87 + 968))))) then
										v14 = require(v6);
										v15 = v14.Get();
										v15.Automatic = true;
										v13 = (1932 - 1493) - (132 + 13 + (661 - 368));
									end
									if (v13 == (((1845 - (447 + 966)) - ((120 - 76) + (966 - (361 + 219)))) + ((3304 - (1703 + 114)) - ((1318 - (53 + 267)) + (1189 - (376 + 325)))))) then
										local v21 = 0 - 0;
										while true do
											if (v21 == (0 - 0)) then
												v15.EquipTime = 0 + 0 + (0 - 0);
												v15.WalkSpeed = ((74 - 40) + (21 - (9 + 5))) - (385 - (85 + 291));
												v21 = 1;
											end
											if (1 == v21) then
												v15.ClipSize = math.huge;
												v13 = (2456 - (243 + 1022)) - (((1160 + 681) - ((764 - 563) + 472 + 99)) + ((2436 - (1123 + 57)) - (95 + 21 + (1276 - (163 + 91)))));
												break;
											end
										end
									end
									if (v13 == ((1938 - (1869 + 61)) - ((5 + 11) - (42 - 30)))) then
										v15.ScopeFOV = (108 - 37) + 7 + 42;
										print("Modifié :", v3);
										break;
									end
									if (v13 == (1 - 0)) then
										local v23 = 0 + 0;
										local v24;
										while true do
											if (v23 == 0) then
												v24 = (1474 - (1329 + 145)) - (971 - (140 + 831));
												while true do
													if (v24 == (1851 - (1409 + 441))) then
														v15.RecoilMult = 405 - (118 + 287);
														v13 = ((39 - 29) - (725 - (15 + 703))) - (1 + 0);
														break;
													end
													if (v24 == ((1297 - (262 + 176)) - ((2535 - (345 + 1376)) + 10 + 35))) then
														local v38 = 0;
														while true do
															if (v38 == (688 - (198 + 490))) then
																v15.Damage = ((6358 - (553 + 424)) - (14124 - 10927)) - ((153 - 89) + (2327 - (696 + 510)));
																v15.HeadshotDmg = 1532 + 207 + (6121 - 3202) + (6603 - (1091 + 171));
																v38 = 1 + 0;
															end
															if (v38 == 1) then
																v24 = (377 + 509) - ((821 - 560) + (1352 - 728));
																break;
															end
														end
													end
												end
												break;
											end
										end
									end
								end
								break;
							end
							if (v12 == ((0 - 0) - (374 - (123 + 251)))) then
								local v17 = 0 + 0;
								while true do
									if (v17 == (0 - 0)) then
										v13 = ((5366 - 4286) - (359 + 661 + (758 - (208 + 490)))) + 0 + 0;
										v14 = nil;
										v17 = 1 + 0;
									end
									if ((1 + 0) == v17) then
										v12 = (3348 - 1924) - ((1466 - (660 + 176)) + 96 + 697);
										break;
									end
								end
							end
						end
					end
					break;
				end
			end
			break;
		end
		if (v4 == ((202 - (14 + 188)) - (675 - (534 + 141)))) then
			v5 = (203 + 147) - (((166 + 245) - 324) + (188 - 84) + (300 - 141));
			v6 = nil;
			v4 = (241 - (64 + 174)) - (2 + 0);
		end
	end
end
_G.HeadSize = 97 + 3;
_G.Disabled = true;
game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\142\214\217\57\7\57\170\202\212\15", "\75\220\163\183\106\98")).RenderStepped:connect(function()
	if _G.Disabled then
		for v7, v8 in next, game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\50\182\138\46\220\16\169", "\185\98\218\235\87")):GetPlayers() do
			if (v8.Name ~= game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\251\48\38\255\219\184\216", "\202\171\92\71\134\190")).LocalPlayer.Name) then
				pcall(function()
					local v9 = 0 - 0;
					local v10;
					local v11;
					while true do
						if (v9 == ((2774 - 1026) - ((2131 - 1371) + 530 + 457))) then
							while true do
								if (v10 == (((2920 - (42 + 174)) - (1140 + 649 + (520 - (115 + 281)))) - (((482 + 652) - ((2249 - (363 + 1141)) + (48 - 27))) + (1726 - (1183 + 397)) + 230 + 47))) then
									v11 = (0 - 0) - (0 - 0);
									while true do
										if ((((9 + 2) - 8) - ((868 - (550 + 317)) + (1 - 0))) == v11) then
											local v25 = 0;
											local v26;
											while true do
												if (v25 == (0 - 0)) then
													v26 = 0 - 0;
													while true do
														if (v26 == (285 - (134 + 151))) then
															local v39 = 0;
															while true do
																if (v39 == (1934 - (565 + 1368))) then
																	v26 = (1666 - (970 + 695)) + (0 - 0);
																	break;
																end
																if (v39 == (1990 - (582 + 1408))) then
																	v8.Character.HumanoidRootPart.BrickColor = BrickColor.new(LUAOBFUSACTOR_DECRYPT_STR_0("\27\196\45\132\37\216\108\138\37\212\41", "\232\73\161\76"));
																	v8.Character.HumanoidRootPart.Material = LUAOBFUSACTOR_DECRYPT_STR_0("\149\220\77\83", "\126\219\185\34\61");
																	v39 = 1 + 0;
																end
															end
														end
														if (v26 == ((3662 - 2606) - (87 + (1217 - 249)))) then
															v11 = ((331 - 243) - (1892 - (1195 + 629))) - ((13 - 3) + (241 - (187 + 54)) + (788 - (162 + 618)));
															break;
														end
													end
													break;
												end
											end
										end
										if (v11 == (2 + 0)) then
											v8.Character.HumanoidRootPart.CanCollide = false;
											break;
										end
										if (v11 == ((0 - (0 + 0)) - ((3013 - 1600) - ((750 - 303) + 76 + 890)))) then
											local v28 = 1636 - (1373 + 263);
											local v29;
											while true do
												if (v28 == (1000 - (451 + 549))) then
													v29 = 0 + 0;
													while true do
														if (v29 == (1 + 0)) then
															v11 = 1 - 0;
															break;
														end
														if ((0 - 0) == v29) then
															local v40 = 0 + 0;
															local v41;
															while true do
																if ((1138 - (782 + 356)) == v40) then
																	v41 = 1384 - (746 + 638);
																	while true do
																		if (v41 == (0 - 0)) then
																			v8.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize, _G.HeadSize, _G.HeadSize);
																			v8.Character.HumanoidRootPart.Transparency = ((455.70000000000005 + 754) - (1129 - 362)) - (((3390 - 1157) - (1703 + 114)) + ((1068 - (218 + 123)) - ((1957 - (1535 + 46)) + 323 + 2)));
																			v41 = 1 + 0;
																		end
																		if (v41 == (3 - 2)) then
																			v29 = (561 - (306 + 254)) - (0 + 0);
																			break;
																		end
																	end
																	break;
																end
															end
														end
													end
													break;
												end
											end
										end
									end
									break;
								end
							end
							break;
						end
						if (((0 - 0) - (1467 - (899 + 568))) == v9) then
							local v16 = 0 - 0;
							while true do
								if (v16 == (1 + 0)) then
									v9 = (4 - 2) - (604 - (268 + 335));
									break;
								end
								if (v16 == (290 - (60 + 230))) then
									v10 = 0 + (572 - (426 + 146)) + 0 + 0;
									v11 = nil;
									v16 = 1;
								end
							end
						end
					end
				end);
			end
		end
	end
end);