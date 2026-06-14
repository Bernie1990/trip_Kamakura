# Bernie & Nydia 東京旅行手札 🗾

東京 & 鎌倉・江之島 7 日自由行（6/23–6/29）的行程網站與筆記。純靜態網頁，可部署到 Cloudflare Pages / GitHub Pages，出國時用手機直接開、免 VPN。

## 📁 專案結構

```
trip_plan/
├── web/                      # ← 部署目錄（Build output directory 設這個）
│   ├── index.html            # 行程手札（每日行程、住宿、必買、拍照、和服攻略）
│   ├── route.html            # 旅遊路徑示意圖（SVG 概念方位圖）
│   ├── map.html              # 真實比例互動地圖（Leaflet + OpenStreetMap）
│   └── transit.html          # 每日各點間的最佳大眾運輸方式
├── Bernie_Nydia_東京旅行手札.md   # 行程主筆記（不部署）
├── Tokyo_江ノ島_佳玲.md           # Nydia 的景點收藏清單（不部署）
├── 和服租借攻略.md                # 和服/浴衣租借攻略（不部署）
└── README.md
```

> `.md` 筆記檔留在根目錄、**不會被部署**，所以含較多個資的筆記不會公開上線。

## 🖥️ 本機預覽

```bash
python3 -m http.server 9004 --directory web
# 瀏覽器開 http://localhost:9004/
```

## ☁️ 部署到 Cloudflare Pages

1. 推上 GitHub：

```bash
git init
git add .
git commit -m "東京旅行手札網站"
git remote add origin https://github.com/<你的帳號>/<repo>.git
git branch -M main
git push -u origin main
```

2. [Cloudflare Dashboard](https://dash.cloudflare.com) → **Workers & Pages** → **Create** → **Pages** → **Connect to Git**，選此 repo。
3. 建置設定：
   - **Framework preset**：`None`
   - **Build command**：留空
   - **Build output directory**：`web`
4. **Save and Deploy** → 取得 `https://<repo>.pages.dev` 網址。

之後每次 `git push` 會自動重新部署。

## 🔗 外部依賴

- `map.html` 使用 [Leaflet](https://leafletjs.com/)（unpkg CDN）+ [OpenStreetMap](https://www.openstreetmap.org/) 圖磚，需連網但日本可正常存取。
- 各景點「📍」連結指向 Google 地圖搜尋，可直接導航。

## ⚠️ 隱私提醒

頁面含住宿地址與行程資訊。`*.pages.dev` 網址為公開，建議勿張貼到公開場合。如需密碼保護，可改用 Cloudflare Access（免費方案）。
