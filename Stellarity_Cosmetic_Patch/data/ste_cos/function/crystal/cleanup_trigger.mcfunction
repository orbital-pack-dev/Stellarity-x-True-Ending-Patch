# ste_cos:crystal/cleanup_trigger
# Р’С‹Р·С‹РІР°РµС‚СЃСЏ РїСЂРё Р·Р°С…РѕРґРµ РёРіСЂРѕРєР° РІ Р­РЅРґ

# РџСЂРѕРІРµСЂСЏРµРј, Р±С‹Р»Р° Р»Рё СѓР¶Рµ РѕС‡РёСЃС‚РєР°
execute unless score #crystal_cleaned ste_cos.flags matches 1.. run schedule function ste_cos:crystal/cleanup_execute 2s append

# Р’СЃРµРіРґР° СЃР±СЂР°СЃС‹РІР°РµРј РґРѕСЃС‚РёР¶РµРЅРёРµ, С‡С‚РѕР±С‹ РѕРЅРѕ СЃСЂР°Р±РѕС‚Р°Р»Рѕ РїСЂРё СЃР»РµРґСѓСЋС‰РµРј Р·Р°С…РѕРґРµ
advancement revoke @s only ste_cos:void_crossing
