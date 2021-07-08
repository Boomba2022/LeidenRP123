--- IMAGE CONFIG HERE ---

plates = {
    {"plate01","https://cdn.discordapp.com/attachments/836731038050680832/836732033572536330/gdfdfggdfgdf_1.png",540, 300},
    {"plate01_n","https://cdn.discordapp.com/attachments/836731038050680832/836732033572536330/gdfdfggdfgdf_1.png",540, 300},
    {"plate02","https://cdn.discordapp.com/attachments/836731038050680832/836732033572536330/gdfdfggdfgdf_1.png",368,189},
    {"plate02_n","https://cdn.discordapp.com/attachments/836731038050680832/836732033572536330/gdfdfggdfgdf_1.png",300,160},
    {"plate03","https://cdn.discordapp.com/attachments/836731038050680832/836732033572536330/gdfdfggdfgdf_1.png",500,262},
    {"plate03_n","https://cdn.discordapp.com/attachments/836731038050680832/836732033572536330/gdfdfggdfgdf_1.png",300,160},
    {"plate04_n","https://cdn.discordapp.com/attachments/836731038050680832/836732033572536330/gdfdfggdfgdf_1.png",300,154},
    {"plate04","https://cdn.discordapp.com/attachments/836731038050680832/836732033572536330/gdfdfggdfgdf_1.png",370,188},
    {"plate05","https://cdn.discordapp.com/attachments/836731038050680832/836732033572536330/gdfdfggdfgdf_1.png",370,187},
    {"plate05_n","https://cdn.discordapp.com/attachments/836731038050680832/836732033572536330/gdfdfggdfgdf_1.png",370,187},
    {"yankton_plate","https://cdn.discordapp.com/attachments/836731038050680832/836732033572536330/gdfdfggdfgdf_1.png",540, 300},
    {"yankton_plate_n","https://cdn.discordapp.com/attachments/836731038050680832/836732033572536330/gdfdfggdfgdf_1.png",540, 300},
    }
    
    for l, p in pairs(plates) do
        local txd = CreateRuntimeTxd("testing")
        local duiObj = CreateDui(p[2], p[3], p[4])
        local dui = GetDuiHandle(duiObj)
        local tx = CreateRuntimeTextureFromDuiHandle(txd, "test", dui)
        AddReplaceTexture("vehshare", p[1], "testing", "test")
    end
    
    
    
    local textureDic = CreateRuntimeTxd('duiTxd')
    for i = 1, 10 do
    
        local object = CreateDui('https://imgur.com/VCxtDqC.png', 540, 300)-- this URL doesn't need to be edited, its just the 2d model for the plate
        _G.object = object
    
        local handle = GetDuiHandle(object)
        local tx = CreateRuntimeTextureFromDuiHandle(textureDic, 'duiTex', handle)
    
        AddReplaceTexture('vehshare', 'plate01_n', 'duiTxd', 'duiTex')
    
    end