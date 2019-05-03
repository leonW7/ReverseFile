local L0_0, L1_1, L2_2, L3_3, L4_4
L0_0 = module
L1_1 = "com.teamf1.core.pkg.driver"
L2_2 = package
L2_2 = L2_2.seeall
L0_0(L1_1, L2_2)
L0_0 = require
L1_1 = "teamf1lualib/db"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/util"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/validations"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/returnCodes"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/pkg_returnCodes"
L0_0(L1_1)
L0_0 = require
L1_1 = "com.teamf1.core.returnCodes"
L0_0 = L0_0(L1_1)
L1_1 = require
L2_2 = "com.teamf1.core.validations"
L1_1 = L1_1(L2_2)
L2_2 = require
L3_3 = "com.teamf1.core.pkg.returnCodes"
L2_2 = L2_2(L3_3)
L3_3 = require
L4_4 = "lfs"
L3_3(L4_4)
L3_3 = require
L4_4 = "kliteLib"
L3_3(L4_4)
L3_3 = {}
pkgMgmt = L3_3
L3_3 = ""
L4_4 = ""
pkgMgmt.sys_DB_conn = db.get_connection()
firmwareFile = io.open("/pfrm2.0/var/releaseMilestone.txt", "r")
if firmwareFile ~= nil then
  L4_4 = firmwareFile:read("*line")
  firmwareFile:close()
end
PACKAGE_FILE = "Packages"
if UNIT_NAME == "DSR-150N" or UNIT_NAME == "DSR-150" then
  RELEASE_FILE = "Release-150-" .. L4_4
  PACKAGE_GZ_FILE = PACKAGE_FILE .. "-150-" .. L4_4 .. ".gz"
elseif UNIT_NAME == "DSR-250N" or UNIT_NAME == "DSR-250" then
  RELEASE_FILE = "Release-250-" .. L4_4
  PACKAGE_GZ_FILE = PACKAGE_FILE .. "-250-" .. L4_4 .. ".gz"
elseif PRODUCT_ID == "DSR-1000AC_Ax" or PRODUCT_ID == "DSR-1000_Bx" then
  RELEASE_FILE = "Release-1000AC-v1-" .. L4_4
  PACKAGE_GZ_FILE = PACKAGE_FILE .. "-1000AC-v1-" .. L4_4 .. ".gz"
elseif PRODUCT_ID == "DSR-500AC_Ax" or PRODUCT_ID == "DSR-500_Bx" then
  RELEASE_FILE = "Release-500AC-v1-" .. L4_4
  PACKAGE_GZ_FILE = PACKAGE_FILE .. "-500AC-v1-" .. L4_4 .. ".gz"
else
  RELEASE_FILE = "Release-v1-" .. L4_4
  PACKAGE_GZ_FILE = PACKAGE_FILE .. "-v1-" .. L4_4 .. ".gz"
end
RELEASE_SIG_FILE = RELEASE_FILE .. ".gpg"
PREINST_FILE_NAME = "preinst"
POSTINST_FILE_NAME = "postinst"
POSTRM_FILE_NAME = "postrm"
PRERM_FILE_NAME = "prerm"
PKGMGMT_CTRL_DIR = "/pkgMgmt/control/"
PKGMGMT_TMP = "/tmp/pkgMgmt/"
PKG_TMP = "/tmp/"
CONTROL_FILE_NAME = "control"
CONTROL_TAR_GZ = "control.tar.gz"
DATA_TAR_GZ = "data.tar.gz"
HASH_ALGO = "SHA1"
HASH_ALGOTbl = "pkgMgmtRepo.SHA1"
INFO = 7
ERROR = 4
DEV = 9
HISTORY = 10
DRIVER_FILE = "/pfrm2.0/lib/modules/"
;({}).status = "Status"
;({}).languageId = "LanguageId"
;({}).remove = "remove"
;({}).Remove = "Remove"
;({}).upgrade = "upgrade"
;({}).Upgrade = "Upgrade"
;({}).Install = "Install"
;({}).Installed = "Installed"
;({}).ERROR = "ERROR"
;({}).Package = "Package"
;({}).Description = "Description"
;({}).Version = "Version"
;({}).status = "status"
;({}).same = "Same Version"
;({}).driver = "Driver Exceeded"
DEV = 9
pkgMgmt.sys_DB_con = nil
pkgMgmt.pkg_DB_con = nil
if PRODUCT_ID == "DSR-1000AC_Ax" or PRODUCT_ID == "DSR-1000_Bx" or PRODUCT_ID == "DSR-500AC_Ax" or PRODUCT_ID == "DSR-500_Bx" then
  AR_BIN_NAME = "/sbin/ar x"
  DU_BIN_NAME = "/usr/bin/du -shk"
elseif UNIT_NAME == "DSR-1000N" or UNIT_NAME == "DSR-1000" or UNIT_NAME == "DSR-500N" or UNIT_NAME == "DSR-500" then
  AR_BIN_NAME = "/usr/bin/ar x"
  DU_BIN_NAME = "/bin/du -shk"
elseif UNIT_NAME == "DSR-250N" or UNIT_NAME == "DSR-250" or UNIT_NAME == "DSR-150N" or UNIT_NAME == "DSR-150" then
  AR_BIN_NAME = "/bin/ar x"
  DU_BIN_NAME = "/usr/bin/du -shk"
end
RMMOD_BIN_NAME = "/sbin/rmmod"
INSMOD_BIN_NAME = "/sbin/insmod"
MKDIR_BIN_NAME = "/bin/mkdir"
TMP_MANUAL_DIR = "/tmp/manual"
TAR_BIN_NAME = "/bin/tar -xf"
RM_BIN_NAME = "/bin/rm -rf "
CURL_BIN_NAME = "/pfrm2.0/bin/curl -s"
USRKLITE_BIN_NAME = "/pfrm2.0/bin/usrKlite"
TAR_VZF_BIN_NAME = "/bin/tar -tvzf"
CP_BIN_NAME = "/bin/cp -fP"
CHMOD_BIN_NAME = "/bin/chmod 755"
TMP_FREESPACE_FILE = "/tmp/pkgFreeSpace"
function threeGdriversGet()
  local L0_5, L1_6
  L0_5 = pkgMgmt
  L1_6 = db
  L1_6 = L1_6.get_connection
  L1_6 = L1_6()
  L0_5.sys_DB_conn = L1_6
  L0_5 = pkgMgmtPkgdbConnect
  L0_5()
  L0_5 = db
  L0_5 = L0_5.getRowsWhere
  L1_6 = _UPVALUE0_
  L0_5 = L0_5(L1_6, "Section='Drivers'", false)
  L1_6 = db
  L1_6 = L1_6.getTable
  L1_6 = L1_6(_UPVALUE1_, false)
  if #L0_5 == 0 and #L1_6 ~= 0 then
    for _FORV_6_, _FORV_7_ in pairs(L1_6) do
      _FORV_7_.name = _FORV_7_.Package
      _FORV_7_.description = _FORV_7_.Description
      _FORV_7_.Version = _FORV_7_.Version
      _FORV_7_.buttons = {}
      _FORV_7_.buttons[1] = {}
      if db.getRowWhere(_UPVALUE1_, "Package='" .. _FORV_7_.name .. "' and Version='" .. _FORV_7_.Version .. "'", false).status == _UPVALUE2_ then
        _FORV_7_.version = _FORV_7_.Version
        _FORV_7_.buttons[1].name = _UPVALUE3_
        _FORV_7_.buttons[1].label = _UPVALUE4_.Install .. " " .. _FORV_7_.Version
      else
        _FORV_7_.version = _FORV_7_.Version
        _FORV_7_.buttons[1].name = _UPVALUE4_.remove
        _FORV_7_.buttons[1].label = _UPVALUE4_.Remove .. " " .. _FORV_7_.Version
      end
    end
  end
  for _FORV_6_, _FORV_7_ in pairs(L1_6) do
    ({})[_FORV_7_.Package] = _FORV_7_
  end
  if #L0_5 ~= 0 then
    for _FORV_7_, _FORV_8_ in pairs(L0_5) do
      _FORV_8_.name = _FORV_8_[_UPVALUE0_ .. "." .. _UPVALUE4_.Package]
      _FORV_8_.description = _FORV_8_[_UPVALUE0_ .. "." .. _UPVALUE4_.Description]
      _FORV_8_.Version = _FORV_8_[_UPVALUE0_ .. "." .. _UPVALUE4_.Version]
      _FORV_8_.buttons = {}
      _FORV_8_.buttons[1] = {}
      if db.existsRowWhere(_UPVALUE1_, "Package = '" .. _FORV_8_[_UPVALUE0_ .. "." .. _UPVALUE4_.Package] .. "' and installType is NULL") ~= false then
        if db.getRowsWhere(_UPVALUE1_, "Package = '" .. _FORV_8_[_UPVALUE0_ .. "." .. _UPVALUE4_.Package] .. "' and Version='" .. _FORV_8_[_UPVALUE0_ .. "." .. _UPVALUE4_.Version] .. "' ")[1][_UPVALUE1_ .. "." .. _UPVALUE4_.status] == _UPVALUE4_.Installed then
          if 0 < pkgcompareVersion(_FORV_8_.Version, db.getRowsWhere(_UPVALUE1_, "Package = '" .. _FORV_8_[_UPVALUE0_ .. "." .. _UPVALUE4_.Package] .. "' and Version='" .. _FORV_8_[_UPVALUE0_ .. "." .. _UPVALUE4_.Version] .. "' ")[1][_UPVALUE1_ .. "." .. _UPVALUE4_.Version]) then
            _FORV_8_.buttons[1] = {}
            _FORV_8_.buttons[1].name = _UPVALUE4_.upgrade
            _FORV_8_.buttons[1].label = _UPVALUE4_.Upgrade .. " " .. _FORV_8_.Version
          else
            _FORV_8_.Version = db.getRowsWhere(_UPVALUE1_, "Package = '" .. _FORV_8_[_UPVALUE0_ .. "." .. _UPVALUE4_.Package] .. "' and Version='" .. _FORV_8_[_UPVALUE0_ .. "." .. _UPVALUE4_.Version] .. "' ")[1][_UPVALUE1_ .. "." .. _UPVALUE4_.Version]
            _FORV_8_.buttons[1 + 1].name = _UPVALUE4_.remove
            _FORV_8_.buttons[1 + 1].label = _UPVALUE4_.Remove .. " " .. db.getRowsWhere(_UPVALUE1_, "Package = '" .. _FORV_8_[_UPVALUE0_ .. "." .. _UPVALUE4_.Package] .. "' and Version='" .. _FORV_8_[_UPVALUE0_ .. "." .. _UPVALUE4_.Version] .. "' ")[1][_UPVALUE1_ .. "." .. _UPVALUE4_.Version]
          end
        elseif Default_driver ~= nil then
          if db.getRowsWhere(_UPVALUE1_, "Package = '" .. _FORV_8_[_UPVALUE0_ .. "." .. _UPVALUE4_.Package] .. "' and installType = '0' ")[1][_UPVALUE1_ .. "." .. _UPVALUE4_.status] == _UPVALUE4_.Installed then
            if 0 < pkgcompareVersion(_FORV_8_.Version, db.getRowsWhere(_UPVALUE1_, "Package = '" .. _FORV_8_[_UPVALUE0_ .. "." .. _UPVALUE4_.Package] .. "' and installType = '0' ")[1][_UPVALUE1_ .. "." .. _UPVALUE4_.Version]) then
              _FORV_8_.buttons[1 + 1].name = _UPVALUE4_.upgrade
              _FORV_8_.buttons[1 + 1].label = _UPVALUE4_.Upgrade .. " " .. _FORV_8_.Version
            else
              _FORV_8_.buttons[1 + 1].name = _UPVALUE3_
              _FORV_8_.buttons[1 + 1].label = _UPVALUE4_.Install .. " " .. _FORV_8_[_UPVALUE0_ .. "." .. _UPVALUE4_.Version]
            end
          else
            _FORV_8_.buttons[1 + 1].name = _UPVALUE3_
            _FORV_8_.buttons[1 + 1].label = _UPVALUE4_.Install .. " " .. _FORV_8_[_UPVALUE0_ .. "." .. _UPVALUE4_.Version]
          end
        else
          _FORV_8_.buttons[1 + 1].name = _UPVALUE3_
          _FORV_8_.buttons[1 + 1].label = _UPVALUE4_.Install .. " " .. _FORV_8_[_UPVALUE0_ .. "." .. _UPVALUE4_.Version]
        end
      end
      if db.existsRowWhere(_UPVALUE1_, "Package = '" .. _FORV_8_[_UPVALUE0_ .. "." .. _UPVALUE4_.Package] .. "' and installType is NULL") == false then
        if db.existsRowWhere(_UPVALUE1_, "Package='" .. _FORV_8_[_UPVALUE0_ .. "." .. _UPVALUE4_.Package] .. "' and installType = '0' ") ~= false then
          if db.getRowsWhere(_UPVALUE1_, "Package = '" .. _FORV_8_[_UPVALUE0_ .. "." .. _UPVALUE4_.Package] .. "' and installType = '0' ")[1][_UPVALUE1_ .. "." .. _UPVALUE4_.status] == _UPVALUE4_.Installed then
            if 0 < pkgcompareVersion(_FORV_8_.Version, db.getRowsWhere(_UPVALUE1_, "Package = '" .. _FORV_8_[_UPVALUE0_ .. "." .. _UPVALUE4_.Package] .. "' and installType = '0' ")[1][_UPVALUE1_ .. "." .. _UPVALUE4_.Version]) then
              _FORV_8_.buttons[1 + 1] = {}
              _FORV_8_.buttons[1 + 1].name = _UPVALUE4_.upgrade
              _FORV_8_.buttons[1 + 1].label = _UPVALUE4_.Upgrade .. " " .. _FORV_8_.Version
            else
              _FORV_8_.buttons[1 + 1].name = _UPVALUE3_
              _FORV_8_.buttons[1 + 1].label = _UPVALUE4_.Install .. " " .. _FORV_8_[_UPVALUE0_ .. "." .. _UPVALUE4_.Version]
            end
          else
            _FORV_8_.buttons[1 + 1].name = _UPVALUE3_
            _FORV_8_.buttons[1 + 1].label = _UPVALUE4_.Install .. " " .. _FORV_8_[_UPVALUE0_ .. "." .. _UPVALUE4_.Version]
          end
        else
          _FORV_8_.buttons[1 + 1].name = _UPVALUE3_
          _FORV_8_.buttons[1 + 1].label = _UPVALUE4_.Install .. " " .. _FORV_8_[_UPVALUE0_ .. "." .. _UPVALUE4_.Version]
        end
      end
      _FORV_8_.version = _FORV_8_[_UPVALUE0_ .. "." .. _UPVALUE4_.Version]
    end
    L1_6 = db.getRowsWhere(_UPVALUE1_, "installType='0'", fasle)
    for _FORV_8_, _FORV_9_ in pairs(L1_6) do
      _FORV_9_.name = L1_6[1][_UPVALUE1_ .. "." .. _UPVALUE4_.Package]
      _FORV_9_.description = L1_6[1][_UPVALUE1_ .. "." .. _UPVALUE4_.Description]
      _FORV_9_.Version = L1_6[1][_UPVALUE1_ .. "." .. _UPVALUE4_.Version]
      _FORV_9_.buttons = {}
      _FORV_9_.buttons[1 + 1] = {}
      if _UPVALUE2_ == db.getAttribute(_UPVALUE1_, "Package", _FORV_9_.name, "status") then
        _FORV_9_.version = _FORV_9_.Version
        _FORV_9_.buttons[1 + 1].name = _UPVALUE3_
        _FORV_9_.buttons[1 + 1].label = _UPVALUE4_.Install .. " " .. _FORV_9_.Version
      else
        _FORV_9_.version = _FORV_9_.Version
        _FORV_9_.buttons[1 + 1].name = _UPVALUE4_.remove
        _FORV_9_.buttons[1 + 1].label = _UPVALUE4_.Remove .. " " .. _FORV_9_.Version
      end
    end
  end
  db.set_connection(pkgMgmt.sys_DB_conn)
  return _UPVALUE5_.SUCCESS, L0_5, L1_6
end
function pkgcompareVersion(A0_7, A1_8)
  local L2_9, L3_10
  L2_9 = {}
  L3_10 = {}
  L2_9[1], L2_9[2], L2_9[3] = string.match(A0_7, " *(%d*).?(%d*).?(%d*)")
  L3_10[1], L3_10[2], L3_10[3] = string.match(A1_8, " *(%d*).?(%d*).?(%d*)")
  if L2_9[1] == nil or L2_9[1] == "" or L3_10[1] == nil or L3_10[1] == "" then
    return -2
  end
  if L2_9[2] == nil or L2_9[2] == "" then
    L2_9[2] = "0"
  end
  if L2_9[3] == nil or L2_9[3] == "" then
    L2_9[3] = "0"
  end
  if L3_10[2] == nil or L3_10[2] == "" then
    L3_10[2] = "0"
  end
  if L3_10[3] == nil or L3_10[3] == "" then
    L3_10[3] = "0"
  end
  if L2_9[1] > L3_10[1] then
    return 1
  elseif L2_9[1] == L3_10[1] then
    if L2_9[2] > L3_10[2] then
      return 1
    elseif L2_9[2] == L3_10[2] then
      if L2_9[3] > L3_10[3] then
        return 1
      elseif L2_9[3] == L3_10[3] then
        return 0
      else
        return -1
      end
    else
      return -1
    end
  else
    return -1
  end
end
function threeGdriversHistoryGet()
  pkgMgmt.sys_DB_conn = db.get_connection()
  pkgMgmtPkgdbConnect()
  history = db.getTable(_UPVALUE0_, false)
  for _FORV_3_, _FORV_4_ in pairs(history) do
    _FORV_4_.textMessage = os.date("%a %b %e %T", tonumber(_FORV_4_.time)) .. " " .. _FORV_4_.textMessage
  end
  db.set_connection(pkgMgmt.sys_DB_conn)
  return _UPVALUE1_.SUCCESS, history
end
function threeGdriversManuallyInstall(A0_11)
  local L1_12, L2_13, L3_14, L4_15, L5_16, L6_17, L7_18, L8_19, L9_20, L10_21, L11_22, L12_23, L13_24, L14_25, L15_26, L16_27, L17_28, L18_29
  L1_12 = "OK"
  L2_13 = "OK"
  L3_14 = "OK"
  L4_15 = ""
  L5_16 = ""
  L6_17 = ""
  L7_18 = ""
  L8_19 = ""
  L9_20 = pkgMgmt
  L10_21 = db
  L10_21 = L10_21.get_connection
  L10_21 = L10_21()
  L9_20.sys_DB_conn = L10_21
  L9_20 = pkgMgmtPkgdbConnect
  L9_20()
  L9_20 = db
  L9_20 = L9_20.getRowWhere
  L10_21 = _UPVALUE0_
  L11_22 = "rowid=1"
  L12_23 = false
  L9_20 = L9_20(L10_21, L11_22, L12_23)
  if L9_20 == nil then
    L10_21 = pkgMgmtlog
    L11_22 = DEV
    L12_23 = "couldnt find source pkgMgmtSource."
    L10_21(L11_22, L12_23)
    L10_21 = "Not Installed"
    return L10_21
  end
  L10_21 = L9_20.encKey
  if L10_21 == nil then
    L10_21 = pkgMgmtlog
    L11_22 = DEV
    L12_23 = "couldnt find enc key in pkgMgmtSource."
    L10_21(L11_22, L12_23)
    L10_21 = "Not Installed"
    return L10_21
  end
  L10_21 = string
  L10_21 = L10_21.match
  L11_22 = A0_11
  L12_23 = ".*/(.*).enc"
  L10_21 = L10_21(L11_22, L12_23)
  L4_15 = L10_21
  L10_21 = lfs
  L10_21 = L10_21.currentdir
  L10_21 = L10_21()
  L11_22 = os
  L11_22 = L11_22.execute
  L12_23 = "mkdir /tmp/manual"
  L11_22(L12_23)
  L11_22 = lfs
  L11_22 = L11_22.chdir
  L12_23 = "/tmp/manual/"
  L11_22(L12_23)
  L11_22 = L9_20.encKey
  if L11_22 then
    L11_22 = os
    L11_22 = L11_22.execute
    L12_23 = "/pfrm2.0/bin/usrKlite openssl enc -aes-128-cbc -d -pass file:"
    L13_24 = L9_20.encKey
    L14_25 = " -in "
    L15_26 = A0_11
    L16_27 = " -out "
    L17_28 = L4_15
    L12_23 = L12_23 .. L13_24 .. L14_25 .. L15_26 .. L16_27 .. L17_28
    L11_22 = L11_22(L12_23)
    L5_16 = L11_22
  end
  L11_22 = os
  L11_22 = L11_22.execute
  L12_23 = AR_BIN_NAME
  L13_24 = " "
  L14_25 = L4_15
  L12_23 = L12_23 .. L13_24 .. L14_25
  L11_22(L12_23)
  L11_22 = os
  L11_22 = L11_22.execute
  L12_23 = "tar -xzf "
  L13_24 = CONTROL_TAR_GZ
  L12_23 = L12_23 .. L13_24
  L11_22(L12_23)
  L11_22 = lfs
  L11_22 = L11_22.attributes
  L12_23 = CONTROL_FILE_NAME
  L11_22 = L11_22(L12_23)
  if L11_22 ~= nil then
    L12_23 = L11_22.size
  elseif L12_23 == 0 then
    L12_23 = db
    L12_23 = L12_23.set_connection
    L13_24 = pkgMgmt
    L13_24 = L13_24.sys_DB_conn
    L12_23(L13_24)
    L12_23 = lfs
    L12_23 = L12_23.chdir
    L13_24 = L10_21
    L12_23(L13_24)
    L12_23 = os
    L12_23 = L12_23.execute
    L13_24 = "/bin/rm -rf /tmp/manual"
    L12_23(L13_24)
    L12_23 = os
    L12_23 = L12_23.remove
    L13_24 = A0_11
    L12_23(L13_24)
    L12_23 = os
    L12_23 = L12_23.remove
    L13_24 = L4_15
    L12_23(L13_24)
    L12_23 = _UPVALUE1_
    L12_23 = L12_23.INSTALL_VALID_PACKAGE
    return L12_23
  end
  L12_23 = pkgMgmtParseControlFile
  L13_24 = CONTROL_FILE_NAME
  L12_23 = L12_23(L13_24)
  L8_19 = L12_23.Package
  L13_24 = parsePackage
  L14_25 = L8_19
  L13_24 = L13_24(L14_25)
  if L13_24 == 0 then
    L14_25 = db
    L14_25 = L14_25.set_connection
    L15_26 = pkgMgmt
    L15_26 = L15_26.sys_DB_conn
    L14_25(L15_26)
    L14_25 = lfs
    L14_25 = L14_25.chdir
    L15_26 = L10_21
    L14_25(L15_26)
    L14_25 = os
    L14_25 = L14_25.execute
    L15_26 = "/bin/rm -rf /tmp/manual"
    L14_25(L15_26)
    L14_25 = os
    L14_25 = L14_25.remove
    L15_26 = A0_11
    L14_25(L15_26)
    L14_25 = os
    L14_25 = L14_25.remove
    L15_26 = L4_15
    L14_25(L15_26)
    L14_25 = _UPVALUE1_
    L14_25 = L14_25.INSTALL_VALID_PACKAGE
    return L14_25
  end
  L14_25 = L12_23.Version
  L15_26 = languageDriverCheck
  L16_27 = L8_19
  L17_28 = _UPVALUE2_
  L15_26 = L15_26(L16_27, L17_28)
  L16_27 = UNIT_NAME
  if L16_27 ~= "DSR-150N" then
    L16_27 = UNIT_NAME
  else
    if L16_27 == "DSR-150" then
      L16_27 = "cdc-acm-150-"
      L17_28 = _UPVALUE2_
      L16_27 = L16_27 .. L17_28
      if L8_19 ~= L16_27 then
        L16_27 = "option-150-"
        L17_28 = _UPVALUE2_
        L16_27 = L16_27 .. L17_28
        if L8_19 ~= L16_27 then
          L16_27 = "GobiNet-150-"
          L17_28 = _UPVALUE2_
          L16_27 = L16_27 .. L17_28
        end
      elseif L8_19 == L16_27 then
        L16_27 = io
        L16_27 = L16_27.open
        L17_28 = "/var/usb1Info"
        L18_29 = "r"
        L16_27 = L16_27(L17_28, L18_29)
        if L16_27 ~= nil then
          L18_29 = L16_27
          L17_28 = L16_27.read
          L17_28 = L17_28(L18_29, "*all")
          L18_29 = string
          L18_29 = L18_29.match
          L18_29 = L18_29(L17_28, "Mobile")
          if L18_29 == "Mobile" then
            L3_14 = _UPVALUE3_.ERROR
          end
          L16_27:close()
        end
        L17_28 = io
        L17_28 = L17_28.open
        L18_29 = "/var/usb2Info"
        L17_28 = L17_28(L18_29, "r")
        if L17_28 ~= nil then
          L18_29 = L17_28.read
          L18_29 = L18_29(L17_28, "*all")
          if string.match(L18_29, "Mobile") == "Mobile" then
            L3_14 = _UPVALUE3_.ERROR
          end
          L17_28:close()
        end
      end
  end
  else
    L16_27 = UNIT_NAME
    if L16_27 ~= "DSR-250N" then
      L16_27 = UNIT_NAME
    else
      if L16_27 == "DSR-250" then
        L16_27 = "cdc-acm-250-"
        L17_28 = _UPVALUE2_
        L16_27 = L16_27 .. L17_28
        if L8_19 ~= L16_27 then
          L16_27 = "option-250-"
          L17_28 = _UPVALUE2_
          L16_27 = L16_27 .. L17_28
          if L8_19 ~= L16_27 then
            L16_27 = "GobiNet-250-"
            L17_28 = _UPVALUE2_
            L16_27 = L16_27 .. L17_28
          end
        elseif L8_19 == L16_27 then
          L16_27 = io
          L16_27 = L16_27.open
          L17_28 = "/var/usb1Info"
          L18_29 = "r"
          L16_27 = L16_27(L17_28, L18_29)
          if L16_27 ~= nil then
            L18_29 = L16_27
            L17_28 = L16_27.read
            L17_28 = L17_28(L18_29, "*all")
            L18_29 = string
            L18_29 = L18_29.match
            L18_29 = L18_29(L17_28, "Mobile")
            if L18_29 == "Mobile" then
              L3_14 = _UPVALUE3_.ERROR
            end
            L16_27:close()
          end
          L17_28 = io
          L17_28 = L17_28.open
          L18_29 = "/var/usb2Info"
          L17_28 = L17_28(L18_29, "r")
          if L17_28 ~= nil then
            L18_29 = L17_28.read
            L18_29 = L18_29(L17_28, "*all")
            if string.match(L18_29, "Mobile") == "Mobile" then
              L3_14 = _UPVALUE3_.ERROR
            end
            L17_28:close()
          end
        end
    end
    else
      L16_27 = PRODUCT_ID
      if L16_27 ~= "DSR-1000AC_Ax" then
        L16_27 = PRODUCT_ID
      else
        if L16_27 == "DSR-1000_Bx" then
          L16_27 = "cdc-acm-1000AC-v1-"
          L17_28 = _UPVALUE2_
          L16_27 = L16_27 .. L17_28
          if L8_19 ~= L16_27 then
            L16_27 = "option-1000AC-v1-"
            L17_28 = _UPVALUE2_
            L16_27 = L16_27 .. L17_28
            if L8_19 ~= L16_27 then
              L16_27 = "GobiNet-1000AC-v1-"
              L17_28 = _UPVALUE2_
              L16_27 = L16_27 .. L17_28
            end
          elseif L8_19 == L16_27 then
            L16_27 = io
            L16_27 = L16_27.open
            L17_28 = "/var/usb1Info"
            L18_29 = "r"
            L16_27 = L16_27(L17_28, L18_29)
            if L16_27 ~= nil then
              L18_29 = L16_27
              L17_28 = L16_27.read
              L17_28 = L17_28(L18_29, "*all")
              L18_29 = string
              L18_29 = L18_29.match
              L18_29 = L18_29(L17_28, "Mobile")
              if L18_29 == "Mobile" then
                L3_14 = _UPVALUE3_.ERROR
              end
              L16_27:close()
            end
            L17_28 = io
            L17_28 = L17_28.open
            L18_29 = "/var/usb2Info"
            L17_28 = L17_28(L18_29, "r")
            if L17_28 ~= nil then
              L18_29 = L17_28.read
              L18_29 = L18_29(L17_28, "*all")
              if string.match(L18_29, "Mobile") == "Mobile" then
                L3_14 = _UPVALUE3_.ERROR
              end
              L17_28:close()
            end
          end
      end
      else
        L16_27 = PRODUCT_ID
        if L16_27 ~= "DSR-500AC_Ax" then
          L16_27 = PRODUCT_ID
        else
          if L16_27 == "DSR-500_Bx" then
            L16_27 = "cdc-acm-500AC-v1-"
            L17_28 = _UPVALUE2_
            L16_27 = L16_27 .. L17_28
            if L8_19 ~= L16_27 then
              L16_27 = "option-500AC-v1-"
              L17_28 = _UPVALUE2_
              L16_27 = L16_27 .. L17_28
              if L8_19 ~= L16_27 then
                L16_27 = "GobiNet-500AC-v1-"
                L17_28 = _UPVALUE2_
                L16_27 = L16_27 .. L17_28
              end
            elseif L8_19 == L16_27 then
              L16_27 = io
              L16_27 = L16_27.open
              L17_28 = "/var/usb1Info"
              L18_29 = "r"
              L16_27 = L16_27(L17_28, L18_29)
              if L16_27 ~= nil then
                L18_29 = L16_27
                L17_28 = L16_27.read
                L17_28 = L17_28(L18_29, "*all")
                L18_29 = string
                L18_29 = L18_29.match
                L18_29 = L18_29(L17_28, "Mobile")
                if L18_29 == "Mobile" then
                  L3_14 = _UPVALUE3_.ERROR
                end
                L16_27:close()
              end
              L17_28 = io
              L17_28 = L17_28.open
              L18_29 = "/var/usb2Info"
              L17_28 = L17_28(L18_29, "r")
              if L17_28 ~= nil then
                L18_29 = L17_28.read
                L18_29 = L18_29(L17_28, "*all")
                if string.match(L18_29, "Mobile") == "Mobile" then
                  L3_14 = _UPVALUE3_.ERROR
                end
                L17_28:close()
              end
            end
        end
        else
          L16_27 = "cdc-acm-v1-"
          L17_28 = _UPVALUE2_
          L16_27 = L16_27 .. L17_28
          if L8_19 ~= L16_27 then
            L16_27 = "option-v1-"
            L17_28 = _UPVALUE2_
            L16_27 = L16_27 .. L17_28
            if L8_19 ~= L16_27 then
              L16_27 = "GobiNet-v1-"
              L17_28 = _UPVALUE2_
              L16_27 = L16_27 .. L17_28
            end
          elseif L8_19 == L16_27 then
            L16_27 = io
            L16_27 = L16_27.open
            L17_28 = "/var/usb1Info"
            L18_29 = "r"
            L16_27 = L16_27(L17_28, L18_29)
            if L16_27 ~= nil then
              L18_29 = L16_27
              L17_28 = L16_27.read
              L17_28 = L17_28(L18_29, "*all")
              L18_29 = string
              L18_29 = L18_29.match
              L18_29 = L18_29(L17_28, "Mobile")
              if L18_29 == "Mobile" then
                L3_14 = _UPVALUE3_.ERROR
              end
              L16_27:close()
            end
            L17_28 = io
            L17_28 = L17_28.open
            L18_29 = "/var/usb2Info"
            L17_28 = L17_28(L18_29, "r")
            if L17_28 ~= nil then
              L18_29 = L17_28.read
              L18_29 = L18_29(L17_28, "*all")
              if string.match(L18_29, "Mobile") == "Mobile" then
                L3_14 = _UPVALUE3_.ERROR
              end
              L17_28:close()
            end
          end
        end
      end
    end
  end
  L16_27 = _UPVALUE3_
  L16_27 = L16_27.ERROR
  if L3_14 == L16_27 then
    L16_27 = lfs
    L16_27 = L16_27.chdir
    L17_28 = L10_21
    L16_27(L17_28)
    L16_27 = os
    L16_27 = L16_27.execute
    L17_28 = "/bin/rm -rf /tmp/manual"
    L16_27(L17_28)
    L16_27 = _UPVALUE1_
    L16_27 = L16_27.THREEG_LOADING_FAILED
    return L16_27
  end
  if L15_26 == "OK" then
    L16_27 = pkgInstallManyally
    L17_28 = L4_15
    L18_29 = L14_25
    L17_28 = L16_27(L17_28, L18_29, L8_19)
    L6_17 = L17_28
    L7_18 = L16_27
    L16_27 = _UPVALUE3_
    L16_27 = L16_27.Installed
    if L7_18 ~= L16_27 then
      L16_27 = _UPVALUE3_
      L2_13 = L16_27.ERROR
      L16_27 = db
      L16_27 = L16_27.set_connection
      L17_28 = pkgMgmt
      L17_28 = L17_28.sys_DB_conn
      L16_27(L17_28)
      L16_27 = lfs
      L16_27 = L16_27.chdir
      L17_28 = L10_21
      L16_27(L17_28)
      L16_27 = _UPVALUE1_
      L16_27 = L16_27.UPGRADE_INSTALLED
      if L6_17 == L16_27 then
        L16_27 = _UPVALUE1_
        L16_27 = L16_27.UPGRADE_INSTALLED
        return L16_27
      else
        L16_27 = _UPVALUE1_
        L16_27 = L16_27.INSTALL_VALID_PACKAGE
        return L16_27
      end
    end
    L16_27 = _UPVALUE4_
    L6_17 = L16_27.SUCCESS
  else
    L16_27 = _UPVALUE3_
    L16_27 = L16_27.ERROR
    if L1_12 == L16_27 then
      L16_27 = _UPVALUE3_
      L2_13 = L16_27.ERROR
      L16_27 = _UPVALUE1_
      L6_17 = L16_27.DRIVER_NOT_SUPPORTED
    else
      L16_27 = _UPVALUE3_
      L2_13 = L16_27.ERROR
      L16_27 = _UPVALUE3_
      L16_27 = L16_27.same
      if L15_26 == L16_27 then
        L16_27 = _UPVALUE1_
        L6_17 = L16_27.UPGRADE_INSTALLED
      else
        L16_27 = _UPVALUE3_
        L16_27 = L16_27.driver
        if L15_26 == L16_27 then
          L16_27 = _UPVALUE1_
          L6_17 = L16_27.MORE_THAN_TWO_DRIVER
        else
          L16_27 = _UPVALUE1_
          L6_17 = L16_27.MORE_THAN_TWOLANGS_NOTSUPPORTED
        end
      end
    end
  end
  L16_27 = db
  L16_27 = L16_27.set_connection
  L17_28 = pkgMgmt
  L17_28 = L17_28.sys_DB_conn
  L16_27(L17_28)
  L16_27 = lfs
  L16_27 = L16_27.chdir
  L17_28 = L10_21
  L16_27(L17_28)
  return L6_17
end
function languageDriverCheck(A0_30, A1_31)
  local L2_32, L3_33, L4_34
  L2_32 = pkgMgmtPkgdbConnect
  L2_32()
  L2_32 = "cn-"
  L3_33 = A1_31
  L2_32 = L2_32 .. L3_33
  if A0_30 ~= L2_32 then
    L2_32 = "tc-"
    L3_33 = A1_31
    L2_32 = L2_32 .. L3_33
    if A0_30 ~= L2_32 then
      L2_32 = "jp-"
      L3_33 = A1_31
      L2_32 = L2_32 .. L3_33
      if A0_30 ~= L2_32 then
        L2_32 = "ru-"
        L3_33 = A1_31
        L2_32 = L2_32 .. L3_33
        if A0_30 ~= L2_32 then
          L2_32 = "fr-"
          L3_33 = A1_31
          L2_32 = L2_32 .. L3_33
          if A0_30 ~= L2_32 then
            L2_32 = "es-"
            L3_33 = A1_31
            L2_32 = L2_32 .. L3_33
            if A0_30 ~= L2_32 then
              L2_32 = "de-"
              L3_33 = A1_31
              L2_32 = L2_32 .. L3_33
              if A0_30 ~= L2_32 then
                L2_32 = "it-"
                L3_33 = A1_31
                L2_32 = L2_32 .. L3_33
              end
            end
          end
        end
      end
    end
  else
    if A0_30 == L2_32 then
      L2_32 = db
      L2_32 = L2_32.tableSize
      L3_33 = _UPVALUE0_
      L2_32 = L2_32(L3_33)
      if L2_32 == "0" or L2_32 == "1" or L2_32 == "2" then
        L3_33 = db
        L3_33 = L3_33.set_connection
        L4_34 = pkgMgmt
        L4_34 = L4_34.sys_DB_conn
        L3_33(L4_34)
        L3_33 = "OK"
        return L3_33
      else
        L3_33 = db
        L3_33 = L3_33.set_connection
        L4_34 = pkgMgmt
        L4_34 = L4_34.sys_DB_conn
        L3_33(L4_34)
        L3_33 = _UPVALUE1_
        L3_33 = L3_33.ERROR
        return L3_33
      end
  end
  else
    L2_32 = tonumber
    L3_33 = db
    L3_33 = L3_33.tableSize
    L4_34 = _UPVALUE0_
    L4_34 = L3_33(L4_34)
    L2_32 = L2_32(L3_33, L4_34, L3_33(L4_34))
    L2_32 = L2_32 - 1
    L3_33 = db
    L3_33 = L3_33.tableSize
    L4_34 = _UPVALUE2_
    L3_33 = L3_33(L4_34)
    L3_33 = L3_33 or "0"
    L4_34 = tonumber
    L4_34 = L4_34(L3_33)
    L4_34 = L4_34 - tonumber(L2_32)
    L4_34 = L4_34 - 3
    if tonumber(L4_34) == 0 or tonumber(L4_34) == 1 or tonumber(L4_34) == 2 then
      db.set_connection(pkgMgmt.sys_DB_conn)
      return "OK"
    else
      db.set_connection(pkgMgmt.sys_DB_conn)
      if db.existsRowWhere(_UPVALUE2_, "Package='" .. A0_30 .. "' and Version='" .. A1_31 .. "' and installType='0'") == false then
        return _UPVALUE1_.same
      else
        return _UPVALUE1_.driver
      end
    end
  end
  L2_32 = "OK"
  return L2_32
end
function pkgInstallManyally(A0_35, A1_36, A2_37)
  local L3_38, L4_39
  L3_38 = ""
  L4_39 = ""
  L4_39, L3_38 = pkgMgmtInstall(A0_35, A1_36, A2_37)
  lfs.chdir("/pfrm2.0/var/www/")
  os.execute("/bin/rm -rf /tmp/manual")
  if L4_39 ~= _UPVALUE0_.Installed then
    pkgMgmtlog("failed installing " .. A0_35)
    return "Not Installed", L3_38
  end
  return _UPVALUE0_.Installed
end
function pkgMgmtlog(A0_40, A1_41)
  local L2_42
  L2_42 = {}
  L2_42.textMessage = A1_41
  L2_42.time = os.time()
  if _UPVALUE0_ then
    print(A1_41)
  end
  if A0_40 == HISTORY then
    db.insertImport(_UPVALUE1_, L2_42, true)
  end
  L2_42.component = "UMI_COMP_PKGMGMT"
  L2_42.facilityId = 3
  L2_42.logLevel = A0_40
  old_con = _UPVALUE2_
  pkgMgmtSysdbConnect()
  db.insertImport("eventLog", L2_42, true)
  db.set_connection(old_con)
  _UPVALUE2_ = old_con
end
function pkgMgmtSysdbConnect()
  if pkgMgmt.sys_DB_con == nil then
    pkgMgmt.sys_DB_con = db.connect("/tmp/system.db")
  else
    db.set_connection(pkgMgmt.sys_DB_con)
  end
  _UPVALUE0_ = pkgMgmt.sys_DB_con
end
function pkgMgmtPkgdbConnect()
  if pkgMgmt.pkg_DB_con == nil then
    pkgMgmt.pkg_DB_con = db.connect("/pkgMgmt/pkgMgmt.db")
  else
    db.set_connection(pkgMgmt.pkg_DB_con)
  end
  _UPVALUE0_ = pkgMgmt.pkg_DB_con
end
function pkgMgmtParseControlFile(A0_43)
  local L1_44, L2_45, L3_46, L4_47, L5_48, L6_49
  L1_44 = {}
  L2_45 = nil
  for L6_49 in L3_46(L4_47) do
    if string.match(L6_49, "^([^:]+): *(.*)") then
      L2_45, L1_44[string.match(L6_49, "^([^:]+): *(.*)")] = string.match(L6_49, "^([^:]+): *(.*)")
      L2_45, L1_44[string.match(L6_49, "^([^:]+): *(.*)")] = string.match(L6_49, "^([^:]+): *(.*)")
    else
      L1_44[L2_45] = L1_44[L2_45] .. "\n" .. L6_49
    end
  end
  return L1_44
end
function pkgMgmtInstall(A0_50, A1_51, A2_52)
  local L3_53, L4_54, L5_55, L6_56, L7_57, L8_58, L9_59, L10_60, L11_61, L12_62, L13_63, L14_64, L15_65
  L3_53 = 0
  L4_54 = nil
  L5_55 = A0_50
  L6_56 = 0
  if L5_55 == nil then
    L7_57 = "error"
    return L7_57
  else
    L7_57 = string
    L7_57 = L7_57.sub
    L8_58 = L5_55
    L9_59 = 1
    L10_60 = 1
    L7_57 = L7_57(L8_58, L9_59, L10_60)
    if L7_57 ~= "/" then
      L7_57 = lfs
      L7_57 = L7_57.currentdir
      L7_57 = L7_57()
      L8_58 = "/"
      L9_59 = L5_55
      L5_55 = L7_57 .. L8_58 .. L9_59
    end
  end
  L7_57 = pkgMgmtlog
  L8_58 = DEV
  L9_59 = "installing "
  L10_60 = L5_55
  L9_59 = L9_59 .. L10_60
  L7_57(L8_58, L9_59)
  if A2_52 == nil then
    L7_57 = string
    L7_57 = L7_57.match
    L8_58 = L5_55
    L9_59 = ".*/(.*).deb"
    L7_57 = L7_57(L8_58, L9_59)
    A2_52 = L7_57
    if A2_52 == nil then
      L7_57 = "error"
      return L7_57
    end
  end
  L7_57 = PKGMGMT_TMP
  L8_58 = A2_52
  L9_59 = "/"
  L7_57 = L7_57 .. L8_58 .. L9_59
  tmpdir = L7_57
  L7_57 = os
  L7_57 = L7_57.execute
  L8_58 = RM_BIN_NAME
  L9_59 = " "
  L10_60 = tmpdir
  L8_58 = L8_58 .. L9_59 .. L10_60
  L7_57(L8_58)
  L7_57 = lfs
  L7_57 = L7_57.mkdir
  L8_58 = tmpdir
  L8_58 = L7_57(L8_58)
  message = L8_58
  L3_53 = L7_57
  if L3_53 == nil then
    L7_57 = pkgMgmtlog
    L8_58 = ERROR
    L9_59 = "Failed to create dir "
    L10_60 = tmpdir
    L9_59 = L9_59 .. L10_60 .. L11_61 .. L12_62
    L7_57(L8_58, L9_59)
    L7_57 = "error"
    return L7_57
  end
  L7_57 = lfs
  L7_57 = L7_57.currentdir
  L7_57 = L7_57()
  L8_58 = lfs
  L8_58 = L8_58.chdir
  L9_59 = tmpdir
  L8_58(L9_59)
  L8_58 = os
  L8_58 = L8_58.execute
  L9_59 = AR_BIN_NAME
  L10_60 = " "
  L9_59 = L9_59 .. L10_60 .. L11_61
  L8_58(L9_59)
  L8_58 = os
  L8_58 = L8_58.execute
  L9_59 = TAR_BIN_NAME
  L10_60 = " "
  L9_59 = L9_59 .. L10_60 .. L11_61
  L8_58(L9_59)
  L8_58 = pkgMgmtParseControlFile
  L9_59 = tmpdir
  L10_60 = CONTROL_FILE_NAME
  L9_59 = L9_59 .. L10_60
  L8_58 = L8_58(L9_59)
  L9_59 = L8_58["Installed-size"]
  if L9_59 then
    L9_59 = pkgMgmtGetFreeSpace
    L10_60 = "/pkgMgmt"
    L9_59 = L9_59(L10_60)
    available = L9_59
    L9_59 = tonumber
    L10_60 = L8_58["Installed-size"]
    L9_59 = L9_59(L10_60)
    L10_60 = available
    if L9_59 >= L10_60 then
      L9_59 = pkgMgmtlog
      L10_60 = ERROR
      L14_64 = L8_58["Installed-size"]
      L15_65 = " available: "
      L9_59(L10_60, L11_61)
      L9_59 = lfs
      L9_59 = L9_59.chdir
      L10_60 = L7_57
      L9_59(L10_60)
      L9_59 = "error"
      return L9_59
    end
  end
  L9_59 = nil
  L10_60 = db
  L10_60 = L10_60.getRowWhere
  L14_64 = "' and installType is NULL"
  L10_60 = L10_60(L11_61, L12_62, L13_63)
  L9_59 = L10_60
  if L9_59 ~= nil then
    L10_60 = L9_59.status
    if L10_60 == L11_61 then
      L10_60 = pkgcompareVersion
      L10_60 = L10_60(L11_61, L12_62)
      L6_56 = L10_60
      if L6_56 == 0 then
        L10_60 = pkgMgmtlog
        L14_64 = " version "
        L15_65 = L8_58.Version
        L10_60(L11_61, L12_62)
        L10_60 = lfs
        L10_60 = L10_60.chdir
        L10_60(L11_61)
        L10_60 = "error"
        return L10_60, L11_61
      elseif L6_56 > 0 then
        L10_60 = _UPVALUE1_
        L10_60 = L10_60.upgrade
        operation = L10_60
        L10_60 = pkgMgmtRunUpgradeScripts
        L10_60 = L10_60(L11_61, L12_62, L13_63)
        L4_54 = L11_61
        L3_53 = L10_60
      else
        L10_60 = "downgrade"
        operation = L10_60
        L10_60 = pkgMgmtRunUpgradeScripts
        L10_60 = L10_60(L11_61, L12_62, L13_63)
        L4_54 = L11_61
        L3_53 = L10_60
      end
    end
  else
    L10_60 = db
    L10_60 = L10_60.getRowWhere
    L14_64 = "' and installType='0'"
    L10_60 = L10_60(L11_61, L12_62, L13_63)
    if L10_60 ~= nil then
      if L11_61 == L12_62 then
        operation = L11_61
        L4_54 = L12_62
        L3_53 = L11_61
      else
        if L12_62 ~= "DSR-150N" then
        else
          if L12_62 == "DSR-150" then
            L14_64 = "-150%-"
            L15_65 = _UPVALUE5_
            L14_64 = L14_64 .. L15_65
            L15_65 = ""
        end
        else
          if L12_62 ~= "DSR-250N" then
          else
            if L12_62 == "DSR-250" then
              L14_64 = "-250%-"
              L15_65 = _UPVALUE5_
              L14_64 = L14_64 .. L15_65
              L15_65 = ""
          end
          else
            L14_64 = "-v1%-"
            L15_65 = _UPVALUE5_
            L14_64 = L14_64 .. L15_65
            L15_65 = ""
          end
        end
        if L12_62 ~= "DSR-1000AC_Ax" then
        else
          if L12_62 == "DSR-1000_Bx" then
            L14_64 = "-1000AC"
            L15_65 = ""
        end
        elseif L12_62 ~= "DSR-500AC_Ax" then
        elseif L12_62 == "DSR-500_Bx" then
          L14_64 = "-500AC"
          L15_65 = ""
        end
        L14_64 = " "
        L15_65 = L11_61
        L12_62(L13_63)
        L14_64 = "' and installType='0';"
        L14_64 = L12_62
        L13_63(L14_64)
        operation = L13_63
        L14_64 = L8_58
        L15_65 = tmpdir
        L14_64 = L13_63(L14_64, L15_65)
        L4_54 = L14_64
        L3_53 = L13_63
      end
    else
      operation = L11_61
      L4_54 = L12_62
      L3_53 = L11_61
    end
  end
  L10_60 = lfs
  L10_60 = L10_60.chdir
  L10_60(L11_61)
  L10_60 = _UPVALUE1_
  L10_60 = L10_60.Installed
  if L3_53 == L10_60 then
    L10_60 = L8_58.Version
  elseif L4_54 ~= L10_60 then
    L10_60 = pkgMgmtlog
    L14_64 = L4_54
    L15_65 = " failed to "
    L10_60(L11_61)
    L10_60 = operation
    if L10_60 == L11_61 then
      L10_60 = lfs
      L10_60 = L10_60.chdir
      L10_60(L11_61)
      return L3_53
    else
      L10_60 = L9_59.Version
      if L4_54 == L10_60 then
        L10_60 = "update pkgInstalled set status='"
        L14_64 = "' and installType='';"
        L10_60 = L10_60 .. L11_61 .. L12_62 .. L13_63 .. L14_64
        L11_61(L12_62)
        L11_61(L12_62)
        return L3_53
      end
    end
  end
  L10_60 = lfs
  L10_60 = L10_60.mkdir
  L10_60(L11_61)
  L10_60 = lfs
  L10_60 = L10_60.mkdir
  L10_60(L11_61)
  L10_60 = io
  L10_60 = L10_60.open
  L10_60 = L10_60(L11_61, L12_62)
  L14_64 = tmpdir
  L15_65 = DATA_TAR_GZ
  L11_61(L12_62)
  for L14_64 in L11_61(L12_62) do
    L15_65 = string
    L15_65 = L15_65.match
    L15_65 = L15_65(L14_64, ".* .(/.*)")
    if L15_65 and L15_65:sub(-1, -1) ~= "/" then
      L10_60:write(L15_65 .. "\n")
    end
  end
  L11_61(L12_62)
  L11_61(L12_62)
  L14_64 = tmpdir
  L15_65 = CONTROL_TAR_GZ
  L11_61(L12_62)
  L14_64 = tmpdir
  L15_65 = PRERM_FILE_NAME
  L11_61(L12_62)
  L14_64 = tmpdir
  L15_65 = POSTRM_FILE_NAME
  L11_61(L12_62)
  L14_64 = tmpdir
  L15_65 = PREINST_FILE_NAME
  L11_61(L12_62)
  L14_64 = tmpdir
  L15_65 = POSTINST_FILE_NAME
  L11_61(L12_62)
  L14_64 = PKGMGMT_CTRL_DIR
  L15_65 = A2_52
  L11_61(L12_62)
  L14_64 = PKGMGMT_CTRL_DIR
  L15_65 = A2_52
  L11_61(L12_62)
  L14_64 = PKGMGMT_CTRL_DIR
  L15_65 = A2_52
  L11_61(L12_62)
  L14_64 = PKGMGMT_CTRL_DIR
  L15_65 = A2_52
  L11_61(L12_62)
  L11_61(L12_62)
  L11_61(L12_62)
  L14_64 = _UPVALUE4_
  if L13_63 == L14_64 then
    L14_64 = L8_58.Package
    L15_65 = "'and installType is NULL;"
    L14_64 = L11_61
    L13_63(L14_64)
    L14_64 = L8_58.Package
    L15_65 = "','"
  else
    L14_64 = L4_54
    L15_65 = "', status='"
  end
  L14_64 = L11_61
  L13_63(L14_64)
  if L12_62 ~= nil and L12_62 ~= "" and L12_62 ~= nil then
    L14_64 = L12_62
    L13_63(L14_64)
  end
  L14_64 = HISTORY
  L15_65 = L8_58.Package
  L15_65 = L15_65 .. " version " .. L4_54 .. " Installed."
  L13_63(L14_64, L15_65)
  return L3_53
end
function pkgMgmtGetFreeSpace(A0_66)
  os.execute(DU_BIN_NAME .. " " .. A0_66 .. " >" .. TMP_FREESPACE_FILE)
  if io.open(TMP_FREESPACE_FILE, "r") == nil then
    return 0
  end
  if io.open(TMP_FREESPACE_FILE, "r"):read("*line") == nil then
    return 0
  end
  k1, k2 = io.open(TMP_FREESPACE_FILE, "r"):read("*line"):match("([^\t]*)\t*([^\t]*)")
  if k1 then
    if UNIT_NAME == "DSR-250N" or UNIT_NAME == "DSR-250" or UNIT_NAME == "DSR-150N" or UNIT_NAME == "DSR-150" then
      if tonumber(k1) < 4096 then
        return 3072 - tonumber(k1)
      end
    elseif tonumber(k1) < 3072 then
      return 3072 - tonumber(k1)
    end
  else
    return 0
  end
  return 0
end
function pkgMgmtRunUpgradeScripts(A0_67, A1_68, A2_69)
  local L3_70, L4_71, L5_72, L6_73, L7_74, L8_75, L9_76, L10_77, L11_78, L12_79, L13_80, L14_81
  L3_70 = PKGMGMT_CTRL_DIR
  L4_71 = A0_67.Package
  L5_72 = "/"
  L6_73 = PRERM_FILE_NAME
  L3_70 = L3_70 .. L4_71 .. L5_72 .. L6_73
  L4_71 = PKGMGMT_CTRL_DIR
  L5_72 = A0_67.Package
  L6_73 = "/"
  L7_74 = POSTRM_FILE_NAME
  L4_71 = L4_71 .. L5_72 .. L6_73 .. L7_74
  L5_72 = PKGMGMT_CTRL_DIR
  L6_73 = A0_67.Package
  L7_74 = "/"
  L8_75 = PREINST_FILE_NAME
  L5_72 = L5_72 .. L6_73 .. L7_74 .. L8_75
  L6_73 = PKGMGMT_CTRL_DIR
  L7_74 = A0_67.Package
  L8_75 = "/"
  L9_76 = POSTINST_FILE_NAME
  L6_73 = L6_73 .. L7_74 .. L8_75 .. L9_76
  L7_74 = A2_69
  L8_75 = PRERM_FILE_NAME
  L7_74 = L7_74 .. L8_75
  L8_75 = A2_69
  L9_76 = POSTRM_FILE_NAME
  L8_75 = L8_75 .. L9_76
  L9_76 = A2_69
  L10_77 = PREINST_FILE_NAME
  L9_76 = L9_76 .. L10_77
  L10_77 = A2_69
  L11_78 = POSTINST_FILE_NAME
  L10_77 = L10_77 .. L11_78
  L11_78 = A0_67.Version
  L12_79 = A1_68.Version
  L13_80 = 0
  L14_81 = lfs
  L14_81 = L14_81.attributes
  L14_81 = L14_81(L3_70)
  if L14_81 ~= nil then
    L14_81 = os
    L14_81 = L14_81.execute
    L14_81 = L14_81(L3_70 .. " upgrade " .. L12_79)
    L13_80 = L14_81
  end
  if L13_80 ~= 0 then
    L14_81 = 0
    if lfs.attributes(L7_74) ~= nil then
      L14_81 = os.execute(L7_74 .. " failed-upgrade " .. L11_78)
    end
    if L14_81 ~= 0 then
      if lfs.attributes(L6_73) ~= nil then
        L14_81 = os.execute(L6_73 .. " abort-upgrade " .. L12_79)
      end
      if L14_81 ~= 0 then
        return "Failed-Config", L11_78
      else
        return _UPVALUE0_.Installed, L11_78
      end
    end
  end
  L14_81 = lfs
  L14_81 = L14_81.attributes
  L14_81 = L14_81(L9_76)
  if L14_81 ~= nil then
    L14_81 = os
    L14_81 = L14_81.execute
    L14_81 = L14_81(L9_76 .. " upgrade " .. L11_78)
    L13_80 = L14_81
  end
  if L13_80 ~= 0 then
    L14_81 = 0
    if lfs.attributes(L8_75) ~= nil then
      L14_81 = os.execute(L8_75 .. " abort-upgrade " .. L11_78)
    end
    if L14_81 == 0 then
      if lfs.attributes(L6_73) ~= nil then
        L14_81 = os.execute(L6_73 .. " abort-upgrade " .. L12_79)
      end
      if L14_81 ~= 0 then
        return "Unpacked", L11_78
      end
      return _UPVALUE0_.Installed, L11_78
    end
    return "Half-Installed", L11_78
  end
  L14_81 = os
  L14_81 = L14_81.execute
  L14_81(TAR_BIN_NAME .. " " .. A2_69 .. DATA_TAR_GZ)
  L14_81 = lfs
  L14_81 = L14_81.attributes
  L14_81 = L14_81(L4_71)
  if L14_81 ~= nil then
    L14_81 = os
    L14_81 = L14_81.execute
    L14_81 = L14_81(L4_71 .. " upgrade " .. L12_79)
    L13_80 = L14_81
  end
  if L13_80 ~= 0 then
    L14_81 = 0
    if lfs.attributes(L8_75) ~= nil then
      L14_81 = os.execute(L8_75 .. " failed-upgrade " .. L12_79)
    end
    if L14_81 ~= 0 then
      if lfs.attributes(L5_72) ~= nil then
        L14_81 = os.execute(L5_72 .. " abort-upgrade " .. L12_79)
      end
      if L14_81 ~= 0 then
        return "Half-Installed", L11_78
      end
      if lfs.attributes(L8_75) ~= nil then
        L14_81 = os.execute(L8_75 .. " abort-upgrade " .. L11_78)
      end
      if L14_81 ~= 0 then
        return "Half-Installed", L11_78
      end
      if lfs.attributes(L6_73) ~= nil then
        L14_81 = os.execute(L6_73 .. " abort-upgrade " .. L12_79)
      end
      if L14_81 ~= 0 then
        return "Unpacked", L11_78
      end
      return _UPVALUE0_.Installed, L11_78
    end
  end
  L14_81 = lfs
  L14_81 = L14_81.attributes
  L14_81 = L14_81(L10_77)
  if L14_81 ~= nil then
    L14_81 = os
    L14_81 = L14_81.execute
    L14_81 = L14_81(L10_77 .. " configure " .. L11_78)
    L13_80 = L14_81
  end
  if L13_80 ~= 0 then
    L14_81 = "Failed-Config"
    return L14_81, L12_79
  end
  L14_81 = _UPVALUE0_
  L14_81 = L14_81.Installed
  return L14_81, L12_79
end
function pkgMgmtRunInstallScripts(A0_82, A1_83)
  local L2_84, L3_85, L4_86
  L2_84 = 0
  L3_85 = A0_82.Version
  L4_86 = os
  L4_86 = L4_86.execute
  L4_86(TAR_BIN_NAME .. A1_83 .. DATA_TAR_GZ)
  L4_86 = lfs
  L4_86 = L4_86.attributes
  L4_86 = L4_86(A1_83 .. PREINST_FILE_NAME)
  if L4_86 ~= nil then
    L4_86 = os
    L4_86 = L4_86.execute
    L4_86 = L4_86(A1_83 .. PREINST_FILE_NAME .. " install")
    L2_84 = L4_86
  end
  if L2_84 ~= 0 then
    L4_86 = 0
    if lfs.attributes(A1_83 .. POSTRM_FILE_NAME) ~= nil then
      L4_86 = os.execute(A1_83 .. POSTRM_FILE_NAME .. " abort-install")
    end
    if L4_86 ~= 0 then
      return "Half Installed", L3_85
    else
      return "Not Installed", L3_85
    end
  end
  L4_86 = lfs
  L4_86 = L4_86.attributes
  L4_86 = L4_86(A1_83 .. POSTINST_FILE_NAME)
  if L4_86 ~= nil then
    L4_86 = os
    L4_86 = L4_86.execute
    L4_86 = L4_86(A1_83 .. POSTINST_FILE_NAME .. " configure")
    L2_84 = L4_86
  end
  if L2_84 ~= 0 then
    L4_86 = "Failed-Config"
    return L4_86, L3_85
  end
  L4_86 = _UPVALUE0_
  L4_86 = L4_86.Installed
  return L4_86, L3_85
end
function threeGdriversAction(A0_87, A1_88, A2_89)
  local L3_90, L4_91, L5_92, L6_93, L7_94, L8_95
  L3_90 = "OK"
  L4_91 = "OK"
  L5_92 = "threeg"
  L6_93 = pkgMgmt
  L7_94 = db
  L7_94 = L7_94.get_connection
  L7_94 = L7_94()
  L6_93.sys_DB_conn = L7_94
  L6_93 = UNIT_NAME
  if L6_93 ~= "DSR-150N" then
    L6_93 = UNIT_NAME
  else
    if L6_93 == "DSR-150" then
      L6_93 = "cdc-acm-150-"
      L7_94 = _UPVALUE0_
      L6_93 = L6_93 .. L7_94
      if A1_88 ~= L6_93 then
        L6_93 = "option-150-"
        L7_94 = _UPVALUE0_
        L6_93 = L6_93 .. L7_94
        if A1_88 ~= L6_93 then
          L6_93 = "GobiNet-150-"
          L7_94 = _UPVALUE0_
          L6_93 = L6_93 .. L7_94
        end
      else
        if A1_88 == L6_93 then
          L6_93 = io
          L6_93 = L6_93.open
          L7_94 = "/var/usb1Info"
          L8_95 = "r"
          L6_93 = L6_93(L7_94, L8_95)
          if L6_93 ~= nil then
            L8_95 = L6_93
            L7_94 = L6_93.read
            L7_94 = L7_94(L8_95, "*all")
            L8_95 = string
            L8_95 = L8_95.match
            L8_95 = L8_95(L7_94, "Mobile")
            if L8_95 == "Mobile" then
              L4_91 = _UPVALUE1_.ERROR
            end
            L6_93:close()
          end
          L7_94 = io
          L7_94 = L7_94.open
          L8_95 = "/var/usb2Info"
          L7_94 = L7_94(L8_95, "r")
          if L7_94 ~= nil then
            L8_95 = L7_94.read
            L8_95 = L8_95(L7_94, "*all")
            if string.match(L8_95, "Mobile") == "Mobile" then
              L4_91 = _UPVALUE1_.ERROR
            end
            L7_94:close()
          end
      end
      else
        L5_92 = "language"
      end
  end
  else
    L6_93 = UNIT_NAME
    if L6_93 ~= "DSR-250N" then
      L6_93 = UNIT_NAME
    else
      if L6_93 == "DSR-250" then
        L6_93 = "cdc-acm-250-"
        L7_94 = _UPVALUE0_
        L6_93 = L6_93 .. L7_94
        if A1_88 ~= L6_93 then
          L6_93 = "option-250-"
          L7_94 = _UPVALUE0_
          L6_93 = L6_93 .. L7_94
          if A1_88 ~= L6_93 then
            L6_93 = "GobiNet-250-"
            L7_94 = _UPVALUE0_
            L6_93 = L6_93 .. L7_94
          end
        else
          if A1_88 == L6_93 then
            L6_93 = io
            L6_93 = L6_93.open
            L7_94 = "/var/usb1Info"
            L8_95 = "r"
            L6_93 = L6_93(L7_94, L8_95)
            if L6_93 ~= nil then
              L8_95 = L6_93
              L7_94 = L6_93.read
              L7_94 = L7_94(L8_95, "*all")
              L8_95 = string
              L8_95 = L8_95.match
              L8_95 = L8_95(L7_94, "Mobile")
              if L8_95 == "Mobile" then
                L4_91 = _UPVALUE1_.ERROR
              end
              L6_93:close()
            end
            L7_94 = io
            L7_94 = L7_94.open
            L8_95 = "/var/usb2Info"
            L7_94 = L7_94(L8_95, "r")
            if L7_94 ~= nil then
              L8_95 = L7_94.read
              L8_95 = L8_95(L7_94, "*all")
              if string.match(L8_95, "Mobile") == "Mobile" then
                L4_91 = _UPVALUE1_.ERROR
              end
              L7_94:close()
            end
        end
        else
          L5_92 = "language"
        end
    end
    else
      L6_93 = PRODUCT_ID
      if L6_93 ~= "DSR-1000AC_Ax" then
        L6_93 = PRODUCT_ID
      else
        if L6_93 == "DSR-1000_Bx" then
          L6_93 = "cdc-acm-1000AC-v1-"
          L7_94 = _UPVALUE0_
          L6_93 = L6_93 .. L7_94
          if A1_88 ~= L6_93 then
            L6_93 = "option-1000AC-v1-"
            L7_94 = _UPVALUE0_
            L6_93 = L6_93 .. L7_94
            if A1_88 ~= L6_93 then
              L6_93 = "GobiNet-1000AC-v1-"
              L7_94 = _UPVALUE0_
              L6_93 = L6_93 .. L7_94
            end
          else
            if A1_88 == L6_93 then
              L6_93 = io
              L6_93 = L6_93.open
              L7_94 = "/var/usb1Info"
              L8_95 = "r"
              L6_93 = L6_93(L7_94, L8_95)
              if L6_93 ~= nil then
                L8_95 = L6_93
                L7_94 = L6_93.read
                L7_94 = L7_94(L8_95, "*all")
                L8_95 = string
                L8_95 = L8_95.match
                L8_95 = L8_95(L7_94, "Mobile")
                if L8_95 == "Mobile" then
                  L4_91 = _UPVALUE1_.ERROR
                end
                L6_93:close()
              end
              L7_94 = io
              L7_94 = L7_94.open
              L8_95 = "/var/usb2Info"
              L7_94 = L7_94(L8_95, "r")
              if L7_94 ~= nil then
                L8_95 = L7_94.read
                L8_95 = L8_95(L7_94, "*all")
                if string.match(L8_95, "Mobile") == "Mobile" then
                  L4_91 = _UPVALUE1_.ERROR
                end
                L7_94:close()
              end
          end
          else
            L5_92 = "language"
          end
      end
      else
        L6_93 = PRODUCT_ID
        if L6_93 ~= "DSR-500AC_Ax" then
          L6_93 = PRODUCT_ID
        else
          if L6_93 == "DSR-500_Bx" then
            L6_93 = "cdc-acm-500AC-v1-"
            L7_94 = _UPVALUE0_
            L6_93 = L6_93 .. L7_94
            if A1_88 ~= L6_93 then
              L6_93 = "option-500AC-v1-"
              L7_94 = _UPVALUE0_
              L6_93 = L6_93 .. L7_94
              if A1_88 ~= L6_93 then
                L6_93 = "GobiNet-500AC-v1-"
                L7_94 = _UPVALUE0_
                L6_93 = L6_93 .. L7_94
              end
            else
              if A1_88 == L6_93 then
                L6_93 = io
                L6_93 = L6_93.open
                L7_94 = "/var/usb1Info"
                L8_95 = "r"
                L6_93 = L6_93(L7_94, L8_95)
                if L6_93 ~= nil then
                  L8_95 = L6_93
                  L7_94 = L6_93.read
                  L7_94 = L7_94(L8_95, "*all")
                  L8_95 = string
                  L8_95 = L8_95.match
                  L8_95 = L8_95(L7_94, "Mobile")
                  if L8_95 == "Mobile" then
                    L4_91 = _UPVALUE1_.ERROR
                  end
                  L6_93:close()
                end
                L7_94 = io
                L7_94 = L7_94.open
                L8_95 = "/var/usb2Info"
                L7_94 = L7_94(L8_95, "r")
                if L7_94 ~= nil then
                  L8_95 = L7_94.read
                  L8_95 = L8_95(L7_94, "*all")
                  if string.match(L8_95, "Mobile") == "Mobile" then
                    L4_91 = _UPVALUE1_.ERROR
                  end
                  L7_94:close()
                end
            end
            else
              L5_92 = "language"
            end
        end
        else
          L6_93 = "cdc-acm-v1-"
          L7_94 = _UPVALUE0_
          L6_93 = L6_93 .. L7_94
          if A1_88 ~= L6_93 then
            L6_93 = "option-v1-"
            L7_94 = _UPVALUE0_
            L6_93 = L6_93 .. L7_94
            if A1_88 ~= L6_93 then
              L6_93 = "GobiNet-v1-"
              L7_94 = _UPVALUE0_
              L6_93 = L6_93 .. L7_94
            end
          else
            if A1_88 == L6_93 then
              L6_93 = io
              L6_93 = L6_93.open
              L7_94 = "/var/usb1Info"
              L8_95 = "r"
              L6_93 = L6_93(L7_94, L8_95)
              if L6_93 ~= nil then
                L8_95 = L6_93
                L7_94 = L6_93.read
                L7_94 = L7_94(L8_95, "*all")
                L8_95 = string
                L8_95 = L8_95.match
                L8_95 = L8_95(L7_94, "Mobile")
                if L8_95 == "Mobile" then
                  L4_91 = _UPVALUE1_.ERROR
                end
                L6_93:close()
              end
              L7_94 = io
              L7_94 = L7_94.open
              L8_95 = "/var/usb2Info"
              L7_94 = L7_94(L8_95, "r")
              if L7_94 ~= nil then
                L8_95 = L7_94.read
                L8_95 = L8_95(L7_94, "*all")
                if string.match(L8_95, "Mobile") == "Mobile" then
                  L4_91 = _UPVALUE1_.ERROR
                end
                L7_94:close()
              end
          end
          else
            L5_92 = "language"
          end
        end
      end
    end
  end
  L6_93 = _UPVALUE1_
  L6_93 = L6_93.ERROR
  if L4_91 == L6_93 then
    L6_93 = _UPVALUE2_
    L6_93 = L6_93.THREEG_LOADING_FAILED
    return L6_93
  end
  if A1_88 ~= nil and L5_92 == "language" then
    L6_93 = string
    L6_93 = L6_93.lower
    L7_94 = A1_88
    L6_93 = L6_93(L7_94)
    A1_88 = L6_93
    L6_93 = A1_88
    L7_94 = "-"
    L8_95 = _UPVALUE0_
    A1_88 = L6_93 .. L7_94 .. L8_95
  end
  L6_93 = ""
  L7_94 = _UPVALUE3_
  if A0_87 ~= L7_94 then
    L7_94 = _UPVALUE1_
    L7_94 = L7_94.upgrade
  else
    if A0_87 == L7_94 then
      L7_94 = "OK"
      L8_95 = languageDriverCheck
      L8_95 = L8_95(A1_88, _UPVALUE0_)
      if L8_95 == "OK" then
        L6_93, statusMessage = pkgMgmtInstallByName(A1_88, A2_89)
        if L6_93 ~= "ok" then
          L3_90 = _UPVALUE1_.ERROR
        end
      else
        L3_90 = _UPVALUE1_.ERROR
        if L8_95 == _UPVALUE1_.same then
          statusMessage = _UPVALUE2_.UPGRADE_INSTALLED
        elseif L8_95 == _UPVALUE1_.driver then
          statusMessage = _UPVALUE2_.MORE_THAN_TWO_DRIVER
        else
          statusMessage = _UPVALUE2_.MORE_THAN_TWOLANGS_NOTSUPPORTED
        end
      end
  end
  else
    L7_94 = _UPVALUE1_
    L7_94 = L7_94.remove
    if A0_87 == L7_94 then
      L7_94 = pkgMgmtRemoveByName
      L8_95 = A1_88
      L7_94 = L7_94(L8_95, A2_89)
      if L7_94 ~= "ok" then
        L7_94 = _UPVALUE1_
        L3_90 = L7_94.ERROR
        L7_94 = _UPVALUE4_
        L7_94 = L7_94.FAILURE
        statusMessage = L7_94
      else
        L7_94 = HIGH_SEC
        if L7_94 == "HIGH" then
          L7_94 = os
          L7_94 = L7_94.execute
          L8_95 = "/pfrm2.0/bin/curl -k https://127.0.0.1/scgi-bin/platform.cgi?page=headerMenuDyn.html -o /var/langFiles/headerMenu.html"
          L7_94(L8_95)
          L7_94 = os
          L7_94 = L7_94.execute
          L8_95 = "/pfrm2.0/bin/curl -k https://127.0.0.1/scgi-bin/platform.cgi?page=jsOnlyStringsDyn.html -o /var/langFiles/jsOnlyStrings.html"
          L7_94(L8_95)
          L7_94 = os
          L7_94 = L7_94.execute
          L8_95 = "/pfrm2.0/bin/curl -k https://127.0.0.1/scgi-bin/platform.cgi?page=wizardLanguageStringsDyn.html -o /var/langFiles/wizardLanguageStrings.js"
          L7_94(L8_95)
        else
          L7_94 = os
          L7_94 = L7_94.execute
          L8_95 = "/pfrm2.0/bin/curl -k http://127.0.0.1/platform.cgi?page=headerMenuDyn.html -o /var/langFiles/headerMenu.html"
          L7_94(L8_95)
          L7_94 = os
          L7_94 = L7_94.execute
          L8_95 = "/pfrm2.0/bin/curl -k http://127.0.0.1/platform.cgi?page=jsOnlyStringsDyn.html -o /var/langFiles/jsOnlyStrings.html"
          L7_94(L8_95)
          L7_94 = os
          L7_94 = L7_94.execute
          L8_95 = "/pfrm2.0/bin/curl -k http://127.0.0.1/platform.cgi?page=wizardLanguageStringsDyn.html -o /var/langFiles/wizardLanguageStrings.js"
          L7_94(L8_95)
        end
        L7_94 = _UPVALUE4_
        L7_94 = L7_94.SUCCESS
        statusMessage = L7_94
      end
    elseif A0_87 == "update" then
      L7_94 = pkgMgmtUpdate
      L8_95 = L7_94()
      statusMessage = L8_95
      L3_90 = L7_94
    else
      L7_94 = _UPVALUE1_
      L3_90 = L7_94.ERROR
      L7_94 = _UPVALUE4_
      L7_94 = L7_94.FAILURE
      statusMessage = L7_94
    end
  end
  L7_94 = db
  L7_94 = L7_94.set_connection
  L8_95 = pkgMgmt
  L8_95 = L8_95.sys_DB_conn
  L7_94(L8_95)
  L7_94 = statusMessage
  return L7_94
end
function pkgMgmtInstallByName(A0_96, A1_97)
  local L2_98, L3_99, L4_100, L5_101, L6_102, L7_103, L8_104, L9_105
  L2_98 = ""
  L3_99 = ""
  L4_100 = pkgMgmtPkgdbConnect
  L4_100()
  L4_100 = db
  L4_100 = L4_100.existsRowWhere
  L5_101 = _UPVALUE0_
  L9_105 = A1_97
  L4_100 = L4_100(L5_101, L6_102)
  if L4_100 ~= false then
    L5_101 = db
    L5_101 = L5_101.existsRowWhere
    L9_105 = "'  and status='Installed' and installType is null"
    L5_101 = L5_101(L6_102, L7_103)
    if false == L5_101 then
      L5_101 = pkgMgmtInstallDefault
      L5_101 = L5_101(L6_102)
      L9_105 = A0_96
      L9_105 = false
      if L5_101 == L7_103 then
        L9_105 = "Package "
        L9_105 = L9_105 .. A0_96 .. " state =" .. L5_101
        L7_103(L8_104, L9_105)
        L9_105 = A0_96
        L9_105 = L9_105 .. " version " .. L6_102.Version .. L5_101
        L7_103(L8_104, L9_105)
        L9_105 = "' where Package='"
        query = L7_103
        L7_103(L8_104)
      end
    else
      L5_101 = "unable to install"
      L9_105 = " version "
      L6_102(L7_103, L8_104)
      return L6_102, L7_103
    end
    L5_101 = _UPVALUE1_
    L5_101 = L5_101.Installed
    return L5_101, L6_102
  end
  L5_101 = db
  L5_101 = L5_101.getRowsWhere
  L9_105 = "'"
  L5_101 = L5_101(L6_102, L7_103, L8_104)
  if L5_101 ~= nil then
  elseif L6_102 == 0 then
    return L6_102, L7_103
  end
  dependencies = L6_102
  for L9_105, _FORV_10_ in L6_102(L7_103) do
    if _FORV_10_.package == nil then
      pkgMgmtlog(ERROR, "unmet dependency " .. L9_105 .. " while installing " .. A0_96)
      return "error", _UPVALUE2_.NOT_ABLE_TO_RESOLVE_DEPENDENCY
    end
  end
  if L6_102 == "error" then
    L9_105 = _UPVALUE2_
    L9_105 = L9_105.NOT_ABLE_TO_DOWNLOAD
    return L8_104, L9_105
  end
  L9_105 = L7_103
  L9_105 = L8_104(L9_105, A1_97, A0_96)
  L3_99 = L9_105
  if L6_102 ~= L8_104 then
    L9_105 = ERROR
    L8_104(L9_105, "failed installing " .. A0_96)
    L9_105 = _UPVALUE2_
    L9_105 = L9_105.NOT_INSTALLED
    return L8_104, L9_105
  end
  L9_105 = _UPVALUE3_
  L9_105 = L9_105.SUCCESS
  return L8_104, L9_105
end
function pkgMgmtRemoveByName(A0_106, A1_107)
  local L2_108
  L2_108 = pkgMgmtPkgdbConnect
  L2_108()
  L2_108 = db
  L2_108 = L2_108.getRowWhere
  L2_108 = L2_108(_UPVALUE0_, "Package='" .. A0_106 .. "' and Version='" .. A1_107 .. "'", false)
  if L2_108 == nil then
    return "error"
  end
  status = pkgMgmtRemove(A0_106, L2_108, A1_107)
  if status ~= _UPVALUE1_ then
    return "error"
  end
  return "ok"
end
function pkgMgmtUpdate()
  local L0_109, L1_110, L2_111, L3_112, L4_113, L5_114, L6_115, L7_116, L8_117, L9_118, L10_119, L11_120, L12_121, L13_122, L14_123, L15_124, L16_125, L17_126, L18_127, L19_128, L20_129
  L0_109 = pkgMgmtPkgdbConnect
  L0_109()
  L0_109 = db
  L0_109 = L0_109.getTable
  L1_110 = _UPVALUE0_
  L0_109 = L0_109(L1_110, L2_111)
  L1_110 = _UPVALUE1_
  L1_110 = L1_110.ERROR
  statusMsg = L2_111
  if L2_111 == nil then
    statusMsg = L2_111
  end
  L2_111(L3_112, L4_113)
  for L5_114, L6_115 in L2_111(L3_112) do
    L7_116 = L6_115.uri
    L8_117 = L7_116
    L9_118 = RELEASE_FILE
    L8_117 = L8_117 .. L9_118
    L9_118 = "/tmp/"
    L10_119 = RELEASE_FILE
    L9_118 = L9_118 .. L10_119
    L10_119 = pkgMgmtlog
    L11_120 = INFO
    L12_121 = "updating package from ["
    L13_122 = L6_115.sourceName
    L14_123 = "] "
    L15_124 = L7_116
    L12_121 = L12_121 .. L13_122 .. L14_123 .. L15_124
    L10_119(L11_120, L12_121)
    L10_119 = os
    L10_119 = L10_119.execute
    L11_120 = CURL_BIN_NAME
    L12_121 = " "
    L13_122 = L8_117
    L14_123 = " -o "
    L15_124 = L9_118
    L11_120 = L11_120 .. L12_121 .. L13_122 .. L14_123 .. L15_124
    L10_119(L11_120)
    L10_119 = lfs
    L10_119 = L10_119.attributes
    L11_120 = L9_118
    L10_119 = L10_119(L11_120)
    if L10_119 ~= nil then
      L11_120 = L10_119.size
    else
      if L11_120 == 0 then
        L11_120 = pkgMgmtlog
        L12_121 = ERROR
        L13_122 = "Error downloading "
        L14_123 = L8_117
        L13_122 = L13_122 .. L14_123
        L11_120(L12_121, L13_122)
        L11_120 = _UPVALUE2_
        L11_120 = L11_120.INTERNET_NOT_REACHABLE
        statusMsg = L11_120
    end
    else
      L11_120 = L6_115.publicKey
      if L11_120 then
        L11_120 = pkgMgmtVerifyRepository
        L12_121 = L7_116
        L13_122 = L6_115.publicKey
        L14_123 = L9_118
        L11_120 = L11_120(L12_121, L13_122, L14_123)
        if L11_120 ~= 0 then
          L11_120 = pkgMgmtlog
          L12_121 = ERROR
          L13_122 = "Repository verificatation failed "
          L14_123 = L7_116
          L15_124 = RELEASE_FILE
          L13_122 = L13_122 .. L14_123 .. L15_124
          L11_120(L12_121, L13_122)
        end
      else
        L11_120 = pkgMgmtParseReleaseFile
        L12_121 = L9_118
        L11_120 = L11_120(L12_121)
        if L11_120 == nil then
          L12_121 = pkgMgmtlog
          L13_122 = ERROR
          L14_123 = "Failed to parse "
          L15_124 = L9_118
          L14_123 = L14_123 .. L15_124
          L12_121(L13_122, L14_123)
        else
          L12_121 = L7_116
          L13_122 = PACKAGE_GZ_FILE
          L8_117 = L12_121 .. L13_122
          L12_121 = "/tmp/"
          L13_122 = PACKAGE_GZ_FILE
          L9_118 = L12_121 .. L13_122
          L12_121 = os
          L12_121 = L12_121.execute
          L13_122 = CURL_BIN_NAME
          L14_123 = " "
          L15_124 = L8_117
          L13_122 = L13_122 .. L14_123 .. L15_124 .. L16_125 .. L17_126
          L12_121(L13_122)
          L12_121 = lfs
          L12_121 = L12_121.attributes
          L13_122 = L9_118
          L12_121 = L12_121(L13_122)
          if L12_121 ~= nil then
            L13_122 = L12_121.size
          else
            if L13_122 == 0 then
              L13_122 = pkgMgmtlog
              L14_123 = ERROR
              L15_124 = "Error downloading "
              L15_124 = L15_124 .. L16_125
              L13_122(L14_123, L15_124)
          end
          else
            L13_122 = pkgMgmtFileHash
            L14_123 = HASH_ALGO
            L15_124 = L9_118
            L14_123 = L13_122(L14_123, L15_124)
            L15_124 = PACKAGE_GZ_FILE
            L15_124 = L11_120[L15_124]
            L15_124 = L15_124[L16_125]
            if L15_124 ~= L14_123 then
              L15_124 = pkgMgmtlog
              L15_124(L16_125, L17_126)
              L15_124 = pkgMgmtlog
              L19_128 = ".got "
              L20_129 = PACKAGE_GZ_FILE
              L20_129 = L11_120[L20_129]
              L20_129 = L20_129[HASH_ALGO]
              L15_124(L16_125, L17_126)
            else
              L15_124 = L9_118.sub
              L15_124 = L15_124(L16_125, L17_126, L18_127)
              packageFileName = L15_124
              L15_124 = os
              L15_124 = L15_124.execute
              L19_128 = ";gunzip "
              L20_129 = L9_118
              L15_124(L16_125)
              L15_124 = pkgMgmtParsePackageFile
              L15_124 = L15_124(L16_125)
              packages = L15_124
              L15_124 = packages
              if L15_124 == nil then
                L15_124 = pkgMgmtlog
                L15_124(L16_125, L17_126)
              end
              L15_124 = db
              L15_124 = L15_124.beginTransaction
              L15_124()
              L15_124 = db
              L15_124 = L15_124.execute
              L15_124(L16_125)
              L15_124 = 1
              for L19_128, L20_129 in L16_125(L17_126) do
                L20_129.sourceName = L6_115.sourceName
                L20_129.InstalledSize = L20_129["Installed-Size"]
                if not db.insertImport(_UPVALUE3_, L20_129, true) then
                  pkgMgmtlog(WARN, "failed to insert package information for package " .. L20_129.Package)
                  break
                else
                  L15_124 = L15_124 + 1
                end
              end
              L16_125()
              L19_128 = L15_124 - 1
              L20_129 = " number of packages."
              L16_125(L17_126, L18_127)
              L1_110 = "ok"
              statusMsg = L16_125
            end
          end
        end
      end
    end
  end
  L3_112(L4_113)
  L3_112(L4_113)
  return L3_112, L4_113
end
function pkgMgmt.installDefault(A0_130)
  local L1_131, L2_132
  L2_132 = UNIT_NAME
  if L2_132 ~= "DSR-150N" then
    L2_132 = UNIT_NAME
  else
    if L2_132 == "DSR-150" then
      L2_132 = A0_130.gsub
      L2_132 = L2_132(A0_130, "-150%-" .. _UPVALUE0_, "")
      L1_131 = L2_132
  end
  else
    L2_132 = UNIT_NAME
    if L2_132 ~= "DSR-250N" then
      L2_132 = UNIT_NAME
    else
      if L2_132 == "DSR-250" then
        L2_132 = A0_130.gsub
        L2_132 = L2_132(A0_130, "-250%-" .. _UPVALUE0_, "")
        L1_131 = L2_132
    end
    else
      L2_132 = PRODUCT_ID
      if L2_132 ~= "DSR-1000AC_Ax" then
        L2_132 = PRODUCT_ID
      else
        if L2_132 == "DSR-1000_Bx" then
          L2_132 = L1_131.gsub
          L2_132 = L2_132(L1_131, "-1000AC%-" .. _UPVALUE0_, "")
          L1_131 = L2_132
      end
      else
        L2_132 = PRODUCT_ID
        if L2_132 ~= "DSR-500AC_Ax" then
          L2_132 = PRODUCT_ID
        else
          if L2_132 == "DSR-500_Bx" then
            L2_132 = L1_131.gsub
            L2_132 = L2_132(L1_131, "-500AC%-" .. _UPVALUE0_, "")
            L1_131 = L2_132
        end
        else
          L2_132 = A0_130.gsub
          L2_132 = L2_132(A0_130, "-v1%-" .. _UPVALUE0_, "")
          L1_131 = L2_132
        end
      end
    end
  end
  L2_132 = nil
  L2_132 = os.execute(INSMOD_BIN_NAME .. " " .. DRIVER_FILE .. L1_131 .. ".def.ko")
  if L2_132 == 0 then
    return _UPVALUE1_.Installed
  else
    return "unable to install"
  end
end
function pkgMgmtCheckDependencies(A0_133)
  local L1_134, L2_135, L3_136, L4_137
  L1_134 = A0_133.depends
  L2_135 = {}
  if L1_134 == nil or L1_134 == "" then
    return L2_135
  end
  L3_136 = L1_134
  L4_137 = ","
  L1_134 = L3_136 .. L4_137
  L3_136 = 1
  L4_137 = {}
  for _FORV_8_ in string.gfind(L1_134, ".-,") do
    L4_137[L3_136] = _FORV_8_
    L3_136 = L3_136 + 1
  end
  if #L4_137 == 0 then
    return L2_135
  end
  for _FORV_8_, _FORV_9_ in ipairs(L4_137) do
    _FORV_9_.name = string.match(_FORV_9_.str, " *([^(,]+)")
    _FORV_9_.version = string.match(_FORV_9_.str, "%((.*)%)")
    if _FORV_9_.version then
      _FORV_9_.version, _FORV_9_.less = string.gsub(_FORV_9_.version, "<", "")
      _FORV_9_.version, _FORV_9_.equal = string.gsub(_FORV_9_.version, "=", "")
      _FORV_9_.version, _FORV_9_.greater = string.gsub(_FORV_9_.version, ">", "")
    end
  end
  ipkgs = db.getTable(_UPVALUE0_, false)
  for _FORV_8_, _FORV_9_ in ipairs(L4_137) do
    for _FORV_13_, _FORV_14_ in pairs(ipkgs) do
      if _FORV_14_.Package == _FORV_9_.name then
        if 0 < pkgcompareVersion(_FORV_9_.version, _FORV_14_.version) then
          if _FORV_9_.less then
            L2_135[_FORV_9_.name] = _FORV_14_
          end
          break
        end
        if pkgcompareVersion(_FORV_9_.version, _FORV_14_.version) == 0 then
          if _FORV_9_.equal then
            L2_135[_FORV_9_.name] = _FORV_14_
          end
          break
        end
        if 0 > pkgcompareVersion(_FORV_9_.version, _FORV_14_.version) and _FORV_9_.greater then
          L2_135[_FORV_9_.name] = _FORV_14_
        end
        break
      end
    end
    if L2_135[_FORV_9_.name] == nil then
      L2_135[_FORV_9_.name] = {}
    end
  end
  return L2_135
end
function pkgMgmtDownload(A0_138)
  local L1_139, L2_140, L3_141, L4_142, L5_143, L6_144, L7_145
  L1_139 = db
  L1_139 = L1_139.getRowWhere
  L2_140 = _UPVALUE0_
  L3_141 = "sourceName='"
  L4_142 = A0_138["pkgMgmtRepo.sourceName"]
  L5_143 = "'"
  L3_141 = L3_141 .. L4_142 .. L5_143
  L4_142 = false
  L1_139 = L1_139(L2_140, L3_141, L4_142)
  if L1_139 == nil then
    L2_140 = pkgMgmtlog
    L3_141 = DEV
    L4_142 = "couldnt find souce "
    L5_143 = A0_138["pkgMgmtRepo.sourceName"]
    L6_144 = "in pkgMgmtSource."
    L4_142 = L4_142 .. L5_143 .. L6_144
    L2_140(L3_141, L4_142)
    L2_140 = "error"
    return L2_140
  end
  L2_140 = ""
  L3_141 = L1_139.encKey
  if L3_141 then
    L2_140 = ".enc"
  end
  L3_141 = L1_139.uri
  L4_142 = "/"
  L5_143 = A0_138["pkgMgmtRepo.Filename"]
  L6_144 = L2_140
  L3_141 = L3_141 .. L4_142 .. L5_143 .. L6_144
  L4_142 = "/tmp/"
  L5_143 = A0_138["pkgMgmtRepo.Filename"]
  L6_144 = L2_140
  L4_142 = L4_142 .. L5_143 .. L6_144
  L5_143 = os
  L5_143 = L5_143.execute
  L6_144 = CURL_BIN_NAME
  L7_145 = " "
  L6_144 = L6_144 .. L7_145 .. L3_141 .. " -o " .. L4_142
  L5_143(L6_144)
  L5_143 = lfs
  L5_143 = L5_143.attributes
  L6_144 = L4_142
  L5_143 = L5_143(L6_144)
  if L5_143 ~= nil then
    L6_144 = L5_143.size
  elseif L6_144 == 0 then
    L6_144 = pkgMgmtlog
    L7_145 = ERROR
    L6_144(L7_145, "Error downloading " .. L3_141)
    L6_144 = "error"
    return L6_144
  end
  L6_144 = pkgMgmtlog
  L7_145 = INFO
  L6_144(L7_145, "downloaded " .. L3_141)
  L6_144 = L1_139.encKey
  if L6_144 then
    L6_144 = L4_142
    L7_145 = "/tmp/"
    L4_142 = L7_145 .. A0_138["pkgMgmtRepo.Filename"]
    L7_145 = os
    L7_145 = L7_145.execute
    L7_145(USRKLITE_BIN_NAME .. " openssl enc -aes-128-cbc -d -pass file:" .. L1_139.encKey .. " -in " .. L6_144 .. " -out " .. L4_142)
  end
  L6_144 = pkgMgmtFileHash
  L7_145 = HASH_ALGO
  L7_145 = L6_144(L7_145, L4_142)
  if A0_138[HASH_ALGOTbl] ~= L7_145 then
    pkgMgmtlog(ERROR, "Hash mismatch for " .. L3_141)
    pkgMgmtlog(ERROR, "calculated " .. L7_145 .. ".Hash in repo " .. A0_138[HASH_ALGOTbl] .. ".")
    return "error"
  end
  pkgMgmtlog(INFO, "Hash verified for " .. L3_141)
  return "ok", L4_142
end
function pkgMgmtRemove(A0_146, A1_147, A2_148)
  local L3_149, L4_150, L5_151, L6_152, L7_153
  L3_149 = A1_147.Version
  L4_150 = A1_147.baseVersion
  if L3_149 == L4_150 then
    L3_149 = pkgMgmtlog
    L4_150 = ERROR
    L5_151 = "Package "
    L6_152 = A1_147.Package
    L7_153 = " version "
    L5_151 = L5_151 .. L6_152 .. L7_153 .. A1_147.Version .. " can not be removed."
    L3_149(L4_150, L5_151)
    L3_149 = _UPVALUE0_
    L3_149 = L3_149.Installed
    return L3_149
  end
  L3_149 = db
  L3_149 = L3_149.existsRowWhere
  L4_150 = _UPVALUE1_
  L5_151 = "Package='"
  L6_152 = A0_146
  L7_153 = "' and Version='"
  L5_151 = L5_151 .. L6_152 .. L7_153 .. A2_148 .. "' and installType='0'"
  L3_149 = L3_149(L4_150, L5_151)
  if L3_149 ~= false then
    L4_150 = pkgMgmtRemoveDefault
    L5_151 = A0_146
    L4_150 = L4_150(L5_151)
    L5_151 = _UPVALUE2_
    if L4_150 == L5_151 then
      L5_151 = pkgMgmtlog
      L6_152 = INFO
      L7_153 = "Package "
      L7_153 = L7_153 .. A0_146 .. " state =" .. L4_150
      L5_151(L6_152, L7_153)
      L5_151 = pkgMgmtlog
      L6_152 = HISTORY
      L7_153 = A0_146
      L7_153 = L7_153 .. " version " .. A1_147.Version .. L4_150
      L5_151(L6_152, L7_153)
      L5_151 = "update pkgInstalled set status='"
      L6_152 = L4_150
      L7_153 = "' where Package='"
      L5_151 = L5_151 .. L6_152 .. L7_153 .. A0_146 .. "'and installType='0'"
      query = L5_151
      L5_151 = db
      L5_151 = L5_151.execute
      L6_152 = query
      L5_151(L6_152)
    else
      L5_151 = pkgMgmtlog
      L6_152 = HISTORY
      L7_153 = A0_146
      L7_153 = L7_153 .. " version " .. A1_147.Version .. L4_150
      L5_151(L6_152, L7_153)
      L5_151 = "error"
      return L5_151
    end
    L5_151 = _UPVALUE2_
    return L5_151
  end
  L4_150 = pkgMgmtRunRemoveScripts
  L5_151 = A1_147
  L4_150 = L4_150(L5_151)
  status = L4_150
  L4_150 = pkgMgmtlog
  L5_151 = INFO
  L6_152 = "Package "
  L7_153 = A0_146
  L6_152 = L6_152 .. L7_153 .. " state =" .. status
  L4_150(L5_151, L6_152)
  L4_150 = db
  L4_150 = L4_150.getRowWhere
  L5_151 = _UPVALUE1_
  L6_152 = "Package='"
  L7_153 = A0_146
  L6_152 = L6_152 .. L7_153 .. "' and installType is NULL"
  L7_153 = false
  L4_150 = L4_150(L5_151, L6_152, L7_153)
  L5_151 = PKG_TMP
  L6_152 = "/"
  L7_153 = L4_150.Package
  L5_151 = L5_151 .. L6_152 .. L7_153
  L6_152 = PKG_TMP
  L7_153 = "/"
  L6_152 = L6_152 .. L7_153 .. L4_150.Package .. ".enc"
  L7_153 = nil
  if status == _UPVALUE2_ then
    L7_153 = "delete from pkgInstalled where Package='" .. A0_146 .. "' and installType is NULL"
    os.execute(RM_BIN_NAME .. " " .. PKGMGMT_CTRL_DIR .. A0_146)
    os.execute(RM_BIN_NAME .. " " .. L5_151)
    os.execute(RM_BIN_NAME .. " " .. L6_152)
  else
    L7_153 = "update pkgInstalled set status='" .. status .. "' where Package='" .. A0_146 .. "'and installType is NULL"
  end
  db.execute(L7_153)
  if io.open(_UPVALUE3_, "w") ~= nil then
    io.open(_UPVALUE3_, "w"):write("en_US")
    io.open(_UPVALUE3_, "w"):close()
  end
  pkgMgmtlog(HISTORY, A0_146 .. " version " .. A1_147.Version .. " uninstalled.")
  return status
end
function pkgMgmtVerifyRepository(A0_154, A1_155, A2_156)
  local L3_157, L4_158
  L3_157 = A0_154
  L4_158 = RELEASE_SIG_FILE
  L3_157 = L3_157 .. L4_158
  L4_158 = "/tmp/"
  L4_158 = L4_158 .. RELEASE_SIG_FILE
  os.execute(CURL_BIN_NAME .. " " .. L3_157 .. " -o " .. L4_158)
  if lfs.attributes(L4_158) == nil or lfs.attributes(L4_158).size == 0 then
    pkgMgmtlog(ERROR, "Error downloading " .. L3_157)
    return -1
  end
  return os.execute(USRKLITE_BIN_NAME .. " openssl dgst -sha1 -verify " .. A1_155 .. " -signature " .. L4_158 .. " " .. A2_156)
end
function pkgMgmtParseReleaseFile(A0_159)
  releaseFile = pkgMgmtParseControlFile(A0_159)
  if releaseFile.MD5Sum then
    for _FORV_4_, _FORV_5_, _FORV_6_ in string.gfind(releaseFile.MD5Sum, [[

 *(w+) *(%d+) *([%w.]+)]]) do
      releaseFile[_FORV_6_] = {}
      releaseFile[_FORV_6_].MD5Sum = _FORV_4_
      releaseFile[_FORV_6_].size = _FORV_5_
    end
  end
  if releaseFile.SHA1 then
    if UNIT_NAME == "DSR-250N" or UNIT_NAME == "DSR-250" or UNIT_NAME == "DSR-150N" or UNIT_NAME == "DSR-150" then
      for _FORV_4_, _FORV_5_, _FORV_6_ in string.gfind(releaseFile.SHA1, [[

 *(%w+) *(%d+) *([%w-%d.]+)]]) do
        releaseFile[_FORV_6_] = releaseFile.name or {}
        releaseFile[_FORV_6_].SHA1 = _FORV_4_
        releaseFile[_FORV_6_].size = _FORV_5_
      end
    else
      for _FORV_4_, _FORV_5_, _FORV_6_ in string.gfind(releaseFile.SHA1, [[

 *(%w+) *(%d+) *([%w-%w%d.]+)]]) do
        releaseFile[_FORV_6_] = releaseFile.name or {}
        releaseFile[_FORV_6_].SHA1 = _FORV_4_
        releaseFile[_FORV_6_].size = _FORV_5_
      end
    end
  end
  return releaseFile
end
function pkgMgmtFileHash(A0_160, A1_161)
  local L2_162, L3_163, L4_164, L5_165, L6_166
  L3_163 = A0_160
  L2_162 = A0_160.match
  L4_164 = "MD5"
  L2_162 = L2_162(L3_163, L4_164)
  if L2_162 then
    L2_162 = kliteLib
    L2_162 = L2_162.MD5Init
    L2_162 = L2_162()
    ret = L2_162
  else
    L2_162 = kliteLib
    L2_162 = L2_162.SHAInit
    L2_162 = L2_162()
    ret = L2_162
  end
  L2_162 = ret
  if L2_162 ~= 0 then
    L2_162 = "error"
    L3_163 = ""
    return L2_162, L3_163
  end
  L2_162 = io
  L2_162 = L2_162.open
  L3_163 = A1_161
  L2_162 = L2_162(L3_163)
  L4_164 = L2_162
  L3_163 = L2_162.read
  L5_165 = "*all"
  L3_163 = L3_163(L4_164, L5_165)
  L5_165 = L2_162
  L4_164 = L2_162.close
  L4_164(L5_165)
  L4_164 = kliteLib
  L4_164 = L4_164.Digest
  L5_165 = L3_163
  L6_166 = L3_163.len
  L6_166 = L6_166(L3_163)
  L6_166 = L4_164(L5_165, L6_166, A0_160)
  if L4_164 ~= 0 then
    return "error", ""
  end
  len, hash = kliteLib.Bin2hex(L5_165, L6_166)
  return "ok", hash
end
function pkgMgmtParsePackageFile(A0_167)
  local L1_168, L2_169, L3_170, L4_171
  packages = L1_168
  package = L1_168
  for L4_171 in L1_168(L2_169) do
    if string.match(L4_171, ":") then
    end
    if string.match(L4_171, "^([^:]+): *(.*)") then
      if package[string.match(L4_171, "^([^:]+): *(.*)")] then
        packages[package.Package] = package
        package = {}
      end
      lastName, package[string.match(L4_171, "^([^:]+): *(.*)")] = string.match(L4_171, "^([^:]+): *(.*)")
    end
  end
  if L1_168 then
    L1_168[L2_169] = L3_170
  end
  return L1_168
end
function pkgMgmtRemoveDefault(A0_172)
  local L1_173, L2_174
  L2_174 = UNIT_NAME
  if L2_174 ~= "DSR-150N" then
    L2_174 = UNIT_NAME
  else
    if L2_174 == "DSR-150" then
      L2_174 = A0_172.gsub
      L2_174 = L2_174(A0_172, "-150%-" .. _UPVALUE0_, "")
      L1_173 = L2_174
  end
  else
    L2_174 = UNIT_NAME
    if L2_174 ~= "DSR-250N" then
      L2_174 = UNIT_NAME
    else
      if L2_174 == "DSR-250" then
        L2_174 = A0_172.gsub
        L2_174 = L2_174(A0_172, "-250%-" .. _UPVALUE0_, "")
        L1_173 = L2_174
    end
    else
      L2_174 = A0_172.gsub
      L2_174 = L2_174(A0_172, "-v1%-" .. _UPVALUE0_, "")
      L1_173 = L2_174
    end
  end
  L2_174 = PRODUCT_ID
  if L2_174 ~= "DSR-1000AC_Ax" then
    L2_174 = PRODUCT_ID
  else
    if L2_174 == "DSR-1000_Bx" then
      L2_174 = L1_173.gsub
      L2_174 = L2_174(L1_173, "-1000AC", "")
      L1_173 = L2_174
  end
  else
    L2_174 = PRODUCT_ID
    if L2_174 ~= "DSR-500AC_Ax" then
      L2_174 = PRODUCT_ID
    elseif L2_174 == "DSR-500_Bx" then
      L2_174 = L1_173.gsub
      L2_174 = L2_174(L1_173, "-500AC", "")
      L1_173 = L2_174
    end
  end
  L2_174 = nil
  L2_174 = os.execute(RMMOD_BIN_NAME .. " " .. L1_173)
  if L2_174 == 0 then
    return _UPVALUE1_
  else
    return "Unable to remove"
  end
end
function pkgMgmtRunRemoveScripts(A0_175)
  local L1_176, L2_177, L3_178, L4_179, L5_180, L6_181
  L1_176 = PKGMGMT_CTRL_DIR
  L2_177 = A0_175.Package
  L1_176 = L1_176 .. L2_177 .. L3_178
  L2_177 = 0
  if L3_178 ~= nil then
    L6_181 = " remove"
    L2_177 = L3_178
  end
  if L2_177 ~= 0 then
    L6_181 = POSTINST_FILE_NAME
    if L4_179 ~= nil then
      L6_181 = POSTINST_FILE_NAME
    end
    if L3_178 ~= 0 then
      L6_181 = "package "
      L6_181 = L6_181 .. A0_175.Package .. A0_175.Version .. " failed to uninstall."
      L4_179(L5_180, L6_181)
      return L4_179
    else
      L6_181 = "package "
      L6_181 = L6_181 .. A0_175.Package .. A0_175.Version .. " failed to uninstall."
      L4_179(L5_180, L6_181)
      return L4_179
    end
  end
  for L6_181 in L3_178(L4_179) do
    os.execute(RM_BIN_NAME .. " " .. L6_181)
  end
  if L3_178 ~= nil then
    L6_181 = " remove"
    L2_177 = L3_178
  end
  if L2_177 ~= 0 then
    L6_181 = A0_175.Package
    L3_178(L4_179, L5_180)
    return L3_178
  end
  return L3_178
end
function pkgMgmtInstallDefault(A0_182)
  local L1_183, L2_184
  L2_184 = UNIT_NAME
  if L2_184 ~= "DSR-150N" then
    L2_184 = UNIT_NAME
  else
    if L2_184 == "DSR-150" then
      L2_184 = A0_182.gsub
      L2_184 = L2_184(A0_182, "-150%-" .. _UPVALUE0_, "")
      L1_183 = L2_184
  end
  else
    L2_184 = UNIT_NAME
    if L2_184 ~= "DSR-250N" then
      L2_184 = UNIT_NAME
    else
      if L2_184 == "DSR-250" then
        L2_184 = A0_182.gsub
        L2_184 = L2_184(A0_182, "-250%-" .. _UPVALUE0_, "")
        L1_183 = L2_184
    end
    else
      L2_184 = A0_182.gsub
      L2_184 = L2_184(A0_182, "-v1%-" .. _UPVALUE0_, "")
      L1_183 = L2_184
    end
  end
  L2_184 = PRODUCT_ID
  if L2_184 ~= "DSR-1000AC_Ax" then
    L2_184 = PRODUCT_ID
  else
    if L2_184 == "DSR-1000_Bx" then
      L2_184 = L1_183.gsub
      L2_184 = L2_184(L1_183, "-1000AC", "")
      L1_183 = L2_184
  end
  else
    L2_184 = PRODUCT_ID
    if L2_184 ~= "DSR-500AC_Ax" then
      L2_184 = PRODUCT_ID
    elseif L2_184 == "DSR-500_Bx" then
      L2_184 = L1_183.gsub
      L2_184 = L2_184(L1_183, "-500AC", "")
      L1_183 = L2_184
    end
  end
  L2_184 = nil
  L2_184 = os.execute(INSMOD_BIN_NAME .. " " .. DRIVER_FILE .. L1_183 .. ".def.ko")
  if L2_184 == 0 then
    return "Installed"
  else
    return "unable to install"
  end
end
function parsePackage(A0_185)
  local L1_186
  L1_186 = 0
  if UNIT_NAME == "DSR-150N" or UNIT_NAME == "DSR-150" then
    if A0_185 == "cdc-acm-150-" .. _UPVALUE0_ or A0_185 == "option-150-" .. _UPVALUE0_ or A0_185 == "GobiNet-150-" .. _UPVALUE0_ then
      L1_186 = 1
    end
  elseif UNIT_NAME == "DSR-250N" or UNIT_NAME == "DSR-250" then
    if A0_185 == "cdc-acm-250-" .. _UPVALUE0_ or A0_185 == "option-250-" .. _UPVALUE0_ or A0_185 == "GobiNet-250-" .. _UPVALUE0_ then
      L1_186 = 1
    end
  elseif PRODUCT_ID == "DSR-1000AC_Ax" or PRODUCT_ID == "DSR-1000_Bx" then
    if A0_185 == "cdc-acm-1000AC-v1-" .. _UPVALUE0_ or A0_185 == "option-1000AC-v1-" .. _UPVALUE0_ or A0_185 == "GobiNet-1000AC-v1-" .. _UPVALUE0_ then
      L1_186 = 1
    end
  elseif PRODUCT_ID == "DSR-500AC_Ax" or PRODUCT_ID == "DSR-500_Bx" then
    if A0_185 == "cdc-acm-500AC-v1-" .. _UPVALUE0_ or A0_185 == "option-500AC-v1-" .. _UPVALUE0_ or A0_185 == "GobiNet-500AC-v1-" .. _UPVALUE0_ then
      L1_186 = 1
    end
  elseif A0_185 == "cdc-acm-v1-" .. _UPVALUE0_ or A0_185 == "option-v1-" .. _UPVALUE0_ or A0_185 == "GobiNet-v1-" .. _UPVALUE0_ then
    L1_186 = 1
  end
  if A0_185 == "cn-" .. _UPVALUE0_ or A0_185 == "tc-" .. _UPVALUE0_ or A0_185 == "jp-" .. _UPVALUE0_ or A0_185 == "ru-" .. _UPVALUE0_ or A0_185 == "fr-" .. _UPVALUE0_ or A0_185 == "es-" .. _UPVALUE0_ or A0_185 == "de-" .. _UPVALUE0_ or A0_185 == "it-" .. _UPVALUE0_ then
    L1_186 = 1
  end
  return L1_186
end
