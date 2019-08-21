import Foundation

let curl = """
curl -H 'Host: app.couples.lv' -H 'Cookie: couples_session=LpeHvbdj84Sat%2BShB23TXPw34qtn%2F30mDoLcmhLFa9GL%2F%2F14MMTv4Y9LlzyOyLjNU4YTmNEE1u8uujTGdMMl5z1s9gY3sDV9RONzyuFR2%2FJS9hPlX9XnF4AI1bbaK0o%2Fr8CqzbZojuFModRCduoeBxDXk2KsI9K4giaR2Uh%2FjOfbI2S7NngnuSTJuBGuFIE2ZyzP3ZfWncvDf3%2FdIEbByo4Hn1PeszlGdis5zHBwjaSZFviznLU5PQo7S5prgrmb3G2m8iLLAs4c0sHrqtCksDsrYg7z26qsvsKW95ScnKSmcpJp9C6xfugQYGFz0qjnD9mg%2BCE6J8FHFn3yAZYPiBi4YO2mInqGhAk20rdYXFlRovyaDq8aQIAN8YycZY4fOAxdfdps6ZrbyuJXcDnwdGmd8BJTOZAph0ygIkpk%2F8P1Nv7LbmhRWW8uIIY3%2FL1X5Uz5XZ58ThwLgC5DxaP%2FdmbCnJf0rER6mnuoI0UwxJSd97KAc9OMmycd7J8EYwpbMnLgHBryYBKd6qkLl1i%2BzAN4J7lR3e7HbSB7ktqS7ySBh8cOv1ucKnbQfqM1Wq%2Fp30cRf4TNxaWu%2FuSghxpHb%2BnKjSBf%2FGudFrIG0vAR%2FujY1QirnJzNFeovgITVekJMie29FL8%2FaDINTYDA6jslh1e8bSTdVXjKjW%2Bma3QAUmBjqkeEMSpmWGVSX377pcVLZ6RpDDilI0w4Mjr6bGPm7dYkw03xbhRFX%2BhyJMhOTnCDr3swfxBDXUR1Ww0ma8H7; _ga=GA1.2.1734855033.1552020264; _gid=GA1.2.1221057630.1552495467; __guu=2ccb527c-28cd-40b2-aec4-2446eb241fcf' -H 'Accept: */*' -H 'User-Agent: Couples/6.0.0 (iPhone; iOS 12.1; Scale/3.00)' -H 'Accept-Language: en;q=1, ja-JP;q=0.9' --data "app_version=6.0.0&idfa=2A95ECE5-54B5-4A84-A2B4-7916281210A7&limit=10000&locale=ja-US&os=ios_development&os_version=12.1&screen_height=2436&screen_width=1125&session_id=81048ec8f2d8b69dbb8f7797606911e365bc3cd9&since_updated_at=1552394915" --compressed 'https://app.couples.lv/api/stream/list'
"""

let p = Process()
p.launchPath = "/bin/sh"
p.arguments = ["-c", curl]
p.launch()
p.waitUntilExit()




