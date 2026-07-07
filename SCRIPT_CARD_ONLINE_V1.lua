gg.alert([[
📖 CARA MENGGUNAKAN SCRIPT
1️⃣ UNLIMITED SEND
	Jalankan ➞ Tunggu Loading ➞ Semua Kartu (Gold | Legendary) Siap dikirimkan Tanpa Batas
2️⃣ CHANGE QUANTITY CARD 
	Jalankan ➞ Masukkan Jumlah Card (Misal Card +1, maka input angka 2, Card +3, maka input 4) dst 
3️⃣ CEK CHANGELOG SECARA BERKALA UNTUK MELIHAT UPDATE TERBARU
    Jalankan ➞ Masukkan Jumlah Batas Atas dan Bawah ➞ Tunggu Loading
]])

function Freeze_Reward_Coupon()
gg.clearResults()
gg.clearList()

-- ===== MENU RANGE MEMORI =====
local GEM = "💾"

local function pretty(t)
    return GEM .. "  " .. t
end

local labels = {
    pretty("Ca + A"),
    pretty("O"),
    pretty("Ca + A + O"),
}

local ranges = {
    gg.REGION_C_ALLOC | gg.REGION_ANONYMOUS,                      -- Ca + A
    gg.REGION_OTHER,                                             -- O
    gg.REGION_C_ALLOC | gg.REGION_ANONYMOUS | gg.REGION_OTHER    -- Ca + A + O
}

local choice = gg.choice(labels, nil, " ✅ Select Memory Range")

if not choice then
    gg.toast("❌ Cancelled")
    os.exit()
end

gg.setRanges(ranges[choice])
gg.toast("✅ Range Set")

-- ===== SCRIPT ASLI KAMU =====
gg.getValues({
    { address = 0xABCDEF12, flags = gg.TYPE_DWORD }
})

gg.searchNumber(
    "1970225964;1599361808;1936025667;65537",
    gg.TYPE_DWORD
)

gg.refineNumber("1970225964", gg.TYPE_DWORD)

n = gg.getResultCount()
jz = gg.getResults(n)


  for i = 1, n do
    gg.addListItems({[1] = {address = jz[i].address - 8,flags = gg.TYPE_DWORD,freeze = true,value = "0", name = "FREEZE_REWARD_01",gg.TYPE_DWORD}})
    gg.addListItems({[1] = {address = jz[i].address - 12,flags = gg.TYPE_DWORD,freeze = true,value = "0",name = "FREEZE_REWARD_02", gg.TYPE_DWORD}})
    gg.addListItems({[1] = {address = jz[i].address - 16,flags = gg.TYPE_DWORD,freeze = true,value = "0",name = "FREEZE_REWARD_03", gg.TYPE_DWORD}})
  end 
  gg.clearResults()
  Change_Reward_Copon()
  gg.alert(" 🥶 FREEZE COUPON SUCCESSFUL✅") 
end

function Change_Reward_Copon()

gg.searchNumber("29;1970225964;7631471;1::", gg.TYPE_DWORD)

gg.refineNumber("29", gg.TYPE_DWORD)

local input = gg.prompt(
    {"Masukkan nilai Modified_8:"},
    {"2"},
    {"number"}
)

if not input then
    gg.toast("Dibatalkan")
    return
end

local modified8 = tonumber(input[1])

local results = gg.getResults(1)

if #results == 0 then
    gg.alert("Value not found! Please try again.")
    return -- Stops script execution if nothing is found
else
 
 local v_1 = {}  
v_1[1] = {}
v_1[1].address = results[1].address + 0x10
v_1[1].flags = gg.TYPE_DWORD
v_1[1].value = "72614316h"
v_1[1].name = "Modified_1"
v_1[1].freeze = false
gg.setValues(v_1)
gg.addListItems(v_1) 
local e_1 = {}
e_1[1] = {}
e_1[1].address = results[1].address + 0x14
e_1[1].flags = gg.TYPE_DWORD
e_1[1].value = "505F4364h"
e_1[1].name = "Modified_2"
e_1[1].freeze = false
gg.setValues(e_1)
gg.addListItems(e_1) 
local p_1 = {}
p_1[1] = {}
p_1[1].address = results[1].address + 0x18
p_1[1].flags = gg.TYPE_DWORD
p_1[1].value = "356B6361h"
p_1[1].name = "Modified_3"
p_1[1].freeze = false
gg.setValues(p_1)
gg.addListItems(p_1) 
local o_1 = {}
o_1[1] = {}
o_1[1].address = results[1].address + 0x1C
o_1[1].flags = gg.TYPE_DWORD
o_1[1].value = "00000000h"
o_1[1].name = "Modified_4"
o_1[1].freeze = false
gg.setValues(o_1)
gg.addListItems(o_1) 
local ha_1 = {}
ha_1[1] = {}
ha_1[1].address = results[1].address + 0x20
ha_1[1].flags = gg.TYPE_DWORD
ha_1[1].value = "00000000h"
ha_1[1].name = "Modified_5"
ha_1[1].freeze = false
gg.setValues(ha_1)
gg.addListItems(ha_1) 
local pa_1 = {}
pa_1[1] = {}
pa_1[1].address = results[1].address + 0x24
pa_1[1].flags = gg.TYPE_DWORD
pa_1[1].value = "00000000h"
pa_1[1].name = "Modified_6"
pa_1[1].freeze = false
gg.setValues(pa_1)
gg.addListItems(pa_1) 
local ya_1 = {}
ya_1[1] = {}
ya_1[1].address = results[1].address + 0x28
ya_1[1].flags = gg.TYPE_DWORD
ya_1[1].value = 0
ya_1[1].name = "Modified_7"
ya_1[1].freeze = false
gg.setValues(ya_1)
gg.addListItems(ya_1) 
local ya_2 = {}
ya_2[1] = {}
ya_2[1].address = results[1].address + 0x2C
ya_2[1].flags = gg.TYPE_DWORD
ya_2[1].value = modified8
ya_2[1].name = "Modified_8"
ya_2[1].freeze = false
gg.setValues(ya_2)
gg.addListItems(ya_2)   
 
 
end

end

USER_NAME = "-"
USER_EXPIRED = "-"
USER_LOADED = false
function Load_User_Info()
    local url = "https://raw.githubusercontent.com/RDHT1010/RDHT_DATABASE/refs/heads/main/LICENSE_KEYS_CARD"

    local response = gg.makeRequest(url)

    if not response or response.code ~= 200 then
        return false
    end

    local myDevice = getDeviceID() -- function milikmu

    for line in response.content:gmatch("[^\r\n]+") do
        local name, code, device, expired =
            line:match("^([^|]+)|([^|]+)|([^|]+)|([^|]+)$")

        if device == myDevice then
            USER_NAME = name
            USER_EXPIRED = expired
            return true
        end
    end

    return false
end

local function getDateTime()
    local days = {
        "Minggu", "Senin", "Selasa", "Rabu",
        "Kamis", "Jumat", "Sabtu"
    }

    local months = {
        "Januari", "Februari", "Maret", "April",
        "Mei", "Juni", "Juli", "Agustus",
        "September", "Oktober", "November", "Desember"
    }
    local t = os.date("*t")

    return string.format(
        "%s, %02d %s %04d | ⏱️ %02d:%02d",
        days[t.wday],
        t.day,
        months[t.month],
        t.year,
        t.hour,
        t.min
    )
end

function GetRemainingTime(expired)

    local y, m, d, h, mi, s =
        expired:match("(%d+)%-(%d+)%-(%d+) (%d+):(%d+):(%d+)")

    if not y then
        return "UNKNOWN"
    end

    local expireTime = os.time({
        year = tonumber(y),
        month = tonumber(m),
        day = tonumber(d),
        hour = tonumber(h),
        min = tonumber(mi),
        sec = tonumber(s)
    })

    local remain = expireTime - os.time()

    if remain <= 0 then
        return "EXPIRED"
    end

    local days = math.floor(remain / 86400)
    local hours = math.floor((remain % 86400) / 3600)
    local mins = math.floor((remain % 3600) / 60)

    return string.format("%dD %dH %dM", days, hours, mins)
end

function Get_Account_Info()

    local info
    if USER_EXPIRED == "SAMPAI DIA CAPE DAN PERGI" then
        info = string.format(
            "👤 %s\n📅 %s\n⏳ %s\n", 
            USER_NAME or "-",
			getDateTime(),
			"Lifetime ♾️"
        )
	elseif USER_EXPIRED == "UNLIMITED" then
        info = string.format(
            "👤 %s\n📅 %s\n⏳ %s\n", 
            USER_NAME or "-",
			getDateTime(),
			"Lifetime ♾️"
		)
    else
        info = string.format(
            "👤 %s\n📅 %s\n⏳ %s\n",
            USER_NAME or "-",
			getDateTime(),
            USER_EXPIRED.."| "..GetRemainingTime(USER_EXPIRED or "")
        )
    end

    return string.format(
[==[
%s	
]==], info)

end

function Unlimited_Send()
    gg.clearResults()
    gg.setVisible(false)
    gg.setRanges(gg.REGION_C_ALLOC | gg.REGION_ANONYMOUS | gg.REGION_OTHER)

    local allResults = {}

    --------------------------------------------------
    -- UNLIMITED SEND
    --------------------------------------------------
	LoadingAuto("Activate Unlimited Send", 5)
    gg.searchNumber("214748451200", gg.TYPE_QWORD)

    local anchorResult = gg.getResults(1)

    if #anchorResult > 0 then
        local anchor = anchorResult[1].address

        for i = 8, 13 do
            table.insert(allResults, {
                address = anchor + (i * 4),
                flags = gg.TYPE_DWORD,
                value = 0,
                freeze = true
            })
        end
    end

    gg.clearResults()

    --------------------------------------------------
    -- GOLD CARD
    --------------------------------------------------
LoadingAuto("Change Gold Card", 2)
gg.searchNumber(
    "1356062990872372325",
    gg.TYPE_QWORD
)
local res1 = gg.getResults(9999)

for _, v in ipairs(res1) do
    v.address = v.address + (6 * 4)
    v.flags = gg.TYPE_DWORD
    v.value = 0
    v.freeze = false
    table.insert(allResults, v)
end

gg.clearResults()

    --------------------------------------------------
    -- LEGENDARY CARD
    --------------------------------------------------
LoadingAuto("Change Legendary Card", 2)
gg.searchNumber(
        "-5655580718823112583",
        gg.TYPE_QWORD
    )
    local res2 = gg.getResults(9999)

for _, v in ipairs(res2) do
    for i = -2, 0 do
        table.insert(allResults, {
            address = v.address + (i * 4),
            flags = gg.TYPE_DWORD,
            value = 0,
            freeze = false
        })
    end
end

    gg.clearResults()

    --------------------------------------------------
    -- EKSEKUSI
    --------------------------------------------------
    if #allResults == 0 then
        gg.alert("❌ TARGET TIDAK DITEMUKAN")
        return
	
    end

    gg.setValues(allResults)
    gg.addListItems(allResults)

    gg.alert("✨️ UNLIMITED SEND AND CONVERT CARD DONE!!\n"..
	        "Author : RDHT RMDN")
end

function Change_Quantity()
    gg.clearResults()
    gg.setVisible(false)
    gg.setRanges(gg.REGION_C_ALLOC | gg.REGION_ANONYMOUS | gg.REGION_OTHER)

    local input = gg.prompt(
        {
            "📝CURRENT CARD COUNT : ",
            "📝NEW CARD COUNT : "
        },
        {
            1,
            500
        },
        {
            "number",
            "number"
        }
    )

    if not input then
        gg.toast("MASUKKAN JUMLAH KARTU")
        return
    end

    local cari = tonumber(input[1])
    local ganti = tonumber(input[2])

    if not cari or not ganti then
        gg.alert("❌ INVALID INPUT❗️")
        return
    end

    if cari == 6 then
        gg.alert("❌ JIKA ADA CARD +5, KIRIM 1 TERLEBIH DAHULU❗️")
        return
    end

    local anchors = {
        1918984974,
        1918984976
    }
	local totalFound = 0
    for _, anchor in ipairs(anchors) do
        gg.clearResults()
		LoadingAuto("Searching Data" .. anchors .. "...", 2)
        gg.searchNumber(
            anchor .. ";" .. cari .. ":29",
            gg.TYPE_DWORD
        )

        gg.refineNumber(cari, gg.TYPE_DWORD)

	local res = gg.getResults(9999)
	
	if #res > 0 then
	    totalFound = totalFound + #res
	    gg.editAll(ganti, gg.TYPE_DWORD)
	end
    end

    gg.clearResults()

	gg.alert(
	    "✅ COMPLETED\n" ..
	    "📝 CURRENT CARD COUNT : " .. cari .. "\n" ..
	    "📝 NEW CARD COUNT : " .. ganti .. "\n" ..
	    "🔍 TOTAL RESULTS : " .. totalFound .. "\n" .. 
		"Author : RDHT RMDN"
	)
end

function Change_Quantity_Instan()
    gg.clearResults()
    gg.setVisible(false)
    gg.setRanges(gg.REGION_C_ALLOC | gg.REGION_ANONYMOUS | gg.REGION_OTHER)

    local input = gg.prompt(
        {
            "📝 LOWER LIMIT :",
            "📝 UPPER LIMIT (MAX 1000) :",
            "📝 NEW CARD COUNT :"
        },
        {
            1,
            1,
            500
        },
        {
            "number",
            "number",
            "number"
        }
    )

    if not input then
        gg.toast("❌ INPUT DIBATALKAN")
        return
    end

    local bawah = tonumber(input[1])
    local atas = tonumber(input[2])
    local ganti = tonumber(input[3])

    if not bawah or not atas or not ganti then
        gg.alert("❌ INVALID INPUT")
        return
    end

    if bawah < 1 or atas > 1000 or bawah > atas then
        gg.alert("❌ BATAS HARUS 1 - 1000")
        return
    end

    local anchors = {
        1918984974,
        1918984976
    }

    local totalFound = 0

    for cari = bawah, atas do

        -- Skip angka 6
        if cari ~= 6 then

            for _, anchor in ipairs(anchors) do

                gg.clearResults()
				gg.toast("Duplicate Card : " .. cari)
				LoadingAuto("Searching Data" .. anchors .. "...", 2)
                gg.searchNumber(
                    anchor .. ";" .. cari .. ":29",
                    gg.TYPE_DWORD
                )

                gg.refineNumber(cari, gg.TYPE_DWORD)

                local res = gg.getResults(9999)

                if #res > 0 then
                    gg.editAll(ganti, gg.TYPE_DWORD)
                    totalFound = totalFound + #res
                end
            end
        end
    end

    gg.clearResults()

gg.alert(
    "✅ COMPLETED\n" ..
    "📝 CURRENT CARD COUNT : " .. bawah .. " → " .. atas .. "\n" ..
    "📝 NEW CARD COUNT : " .. ganti .. "\n" ..
    "🔍 TOTAL RESULTS : " .. totalFound .. "\n" ..
	"Author : RDHT RMDN"
)
end

function Exit_Script()

    local saved = gg.getListItems()

    if #saved > 0 then

        -- Matikan freeze
        for _, v in ipairs(saved) do
            v.freeze = false
        end

        gg.addListItems(saved)

        -- Hapus dari Saved List
        gg.removeListItems(saved)

    end

    gg.clearResults()
    gg.toast("🔚 Script Closed")

    os.exit()
end

function LoadingAuto(text, speed)
    for i = 0, 100 do
        local barCount = math.floor(i / 10)
        local bar = string.rep("■", barCount) ..
                    string.rep("□", 10 - barCount)

        gg.toast(string.format("%s\n[%s] %d%%", text, bar, i))
        gg.sleep(speed or 3)
    end
end
function menuUtama()
if not USER_LOADED then
        Load_User_Info()
        USER_LOADED = true
    end
	local Header

if USER_EXPIRED == "SAMPAI DIA CAPE DAN PERGI" then
    Header =
    " 💻 SCRIPT By RR | RDHT\n" ..
    " 🤝 SUPPORTED By : MF HOST\n" ..
    "════════════════"
else
    Header =
    " 💻SCRIPT BY RR | RDHT\n" ..
    "════════════════"
	end
    local menu = gg.choice({
        "✨ | UNLIMITED SEND (REGULAR|GOLD|LEGENDARY) ",
        "✨ | CHANGE QUANTITY CARD",
		"✨ | CHANGE QUANTITY CARD INSTAN",
		"✨️ | CARD PACK UNLOCK ",
        "🔚 | BACK"
    }, nil, 
Header .. Get_Account_Info())
    
    if menu == 1 then
    Unlimited_Send()
elseif menu == 2 then
    Change_Quantity()
elseif menu == 3 then
    Change_Quantity_Instan()
elseif menu == 4 then
    gg.alert("🎫 Go to Golden Ticket and open Reward Coupon No. 29")
    Freeze_Reward_Coupon()
elseif menu == 5 then
    Exit_Script()
end
end
-- ============================
-- FUNGSI KEMBALI KE MENU
-- ============================
function kembali()
    gg.sleep(800)
    menuUtama()
end

-- ============================
-- AUTO LOOP
-- ============================
while true do
    if gg.isVisible(true) then
        gg.setVisible(false)
        menuUtama()
    end
    gg.sleep(100)
end
