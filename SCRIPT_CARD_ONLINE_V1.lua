gg.alert([[
📖 CARA MENGGUNAKAN SCRIPT
1️⃣ UNLIMITED SEND
	Jalankan ➞ Tunggu Loading ➞ Semua Kartu (Gold | Legendary) Siap dikirimkan Tanpa Batas
2️⃣ CHANGE QUANTITY CARD 
	Jalankan ➞ Masukkan Jumlah Card (Misal Card +1, maka input angka 2, Card +3, maka input 4) dst 
3️⃣ CEK CHANGELOG SECARA BERKALA UNTUK MELIHAT UPDATE TERBARU
    Jalankan ➞ Masukkan Jumlah Batas Atas dan Bawah ➞ Tunggu Loading
]])

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
            "👤 %s\n📅 %s\n⏳ %s", 
            USER_NAME or "-",
			getDateTime(),
			USER_EXPIRED or "-"
        )
	elseif USER_EXPIRED == "UNLIMITED" then
        info = string.format(
            "👤 %s\n📅 %s\n⏳ %s", 
            USER_NAME or "-",
			getDateTime(),
			USER_EXPIRED or "-"
		)
		elseif USER_EXPIRED == "LIFETIME" then
        info = string.format(
            "👤 %s\n📅 %s\n⏳ %s", 
            USER_NAME or "-",
			getDateTime(),
			USER_EXPIRED or "-"
		)
    else
        info = string.format(
            "👤 %s\n📅 %s\n⏳ %s",
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
		LoadingAuto("Searching Data", 2)
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
				LoadingAuto("Searching Data", 2)
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

local XP_ITEM = {
    CROWN = {1634296844, 7169380, 13407, 0, 0, 0},
    WHEAT = {1701398036, 1752654956, 7627109, 0, 0, 0},
    APPLE = {1634291234, 7169380, 54321, 0, 0, 0},
}

function XP_Train(itemName)

    local item = XP_ITEM[itemName]
    if not item then
        gg.alert("Item tidak ditemukan : "..tostring(itemName))
        return
    end

    local input = gg.prompt(
        {"Masukkan jumlah "..itemName.." : (Maks 500)"},
        {"1"},
        {"number"}
    )

    if not input then return end

    local amount = tonumber(input[1])
    if amount == nil or amount < 1 or amount > 500 then
        gg.alert("Hanya bisa angka 1 sampai 500")
        return
    end

    gg.toast("Loading...")
    gg.processResume()
    gg.clearResults()

    gg.searchNumber("1600407924;51", gg.TYPE_DWORD)
    gg.refineNumber("51", gg.TYPE_DWORD)

    local result = gg.getResults(3)

    if #result == 0 then
        gg.alert("Anchor tidak ditemukan")
        return
    end

    for _, r in ipairs(result) do
        local base = r.address

        gg.setValues({
            {
                address = base + 0x34,
                flags = gg.TYPE_FLOAT,
                value = 3
            }
        })

        for g = 0,4 do

            local shift = g * 76 * 4

            local values = {
                {
                    address = base - (85 * 4) - shift,
                    flags = gg.TYPE_DWORD,
                    value = 1
                },
                {
                    address = base - (96 * 4) - shift,
                    flags = gg.TYPE_DWORD,
                    value = amount
                },
                {
                    address = base - (97 * 4) - shift,
                    flags = gg.TYPE_DWORD,
                    value = 0
                }
            }

            local offset = 103
            for _, v in ipairs(item) do
                table.insert(values,{
                    address = base - (offset * 4) - shift,
                    flags = gg.TYPE_DWORD,
                    value = v
                })
                offset = offset - 1
            end

            gg.setValues(values)
        end
    end

    gg.toast(itemName.." ACTIVATED")
end

function Items_Train()
gg.clearResults()

local GIFT = ""

local function pretty(t)
    return GIFT .. "  " .. t 
end

local menu = {
    {
        label = pretty("👑 • CROWN"),
        func = function()
        XP_Train("CROWN")
end
    },
	{
        label = pretty("🌾 • WHEAT"),
        func = function()
       XP_Train("WHEAT")
end
    },
}

local labels = {}
for i, v in ipairs(menu) do
    labels[i] = v.label
end

local choice = gg.choice(labels, nil, "🎯CHOOSE ITEMS")

if not choice then
    gg.toast("SELECT CARD")
    gg.setVisible(false)
    return
end

menu[choice].func()
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
    " 💻 SCRIPT By IIM | RDHT\n" ..
    " 🤝 SUPPORTED By : MF HOST\n" ..
    "════════════════\n"
else
    Header =
    " 💻SCRIPT BY IIM | RDHT\n" ..
    "════════════════\n"
	end
    local menu = gg.choice({
        "🎴 | UNLIMITED SEND (REGULAR|GOLD|LEGENDARY) ",
        "🎴 | CHANGE QUANTITY CARD",
		"🎴 | CHANGE QUANTITY CARD INSTAN",
		"👑 | EXP TRAIN (+ EXP AND COINS) ",
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
    Items_Train()
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
