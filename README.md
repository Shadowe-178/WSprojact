# 極智象棋 · JizhiChess

> 水墨山水風格中國象棋，內建 Minimax AI 對手。  
> Chinese Chess with ink-wash aesthetics and a built-in Minimax AI opponent.

**[▶ 線上遊玩 / Play Online](https://YOUR_USERNAME.github.io/jizhi-chess)**

---

## 功能特色

| 功能 | 說明 |
|------|------|
| 🎨 水墨背景 | Canvas 手繪山水、松林、霧氣、水紋 |
| 🤖 AI 對手 | Minimax + Alpha-Beta 剪枝，普通 (深度 2) / 困難 (深度 3) |
| 💡 AI 建議 | 一鍵查看當前最佳走法 |
| ✅ 走法驗證 | 車、馬、象、士、將、炮、兵完整規則 |
| 📋 棋譜紀錄 | 每步記錄，紅黑分色 |
| 📊 統計資訊 | 勝率、場數、步數、被吃棋子 |
| 📱 RWD | 行動裝置自動單欄排版 |

## 快速部署到 GitHub Pages

### 方法一：Fork 後自動部署（推薦）

1. 點右上角 **Fork** 這個 repo
2. 進入你的 fork → **Settings → Pages**
3. Source 選 **GitHub Actions**
4. 推送任何 commit，或手動觸發 **Actions → Deploy to GitHub Pages → Run workflow**
5. 幾秒後即可在 `https://YOUR_USERNAME.github.io/jizhi-chess` 遊玩

### 方法二：從零建立

```bash
# 1. Clone 或下載此 repo
git clone https://github.com/YOUR_USERNAME/jizhi-chess.git
cd jizhi-chess

# 2. （選用）本地預覽
npx serve .
# 開啟 http://localhost:3000

# 3. 推送到 GitHub，Pages 會自動部署
git add .
git commit -m "feat: initial release"
git push origin main
```

### 方法三：手動上傳

1. 在 GitHub 建立新 repo（可設為 Public）
2. 上傳 `index.html` 和 `.github/workflows/deploy.yml`
3. 進入 **Settings → Pages → Source → GitHub Actions**
4. 等待 Actions 跑完，連結出現在 Pages 設定頁

## 本地開發

這是純靜態 HTML，不需要 Node.js 或任何套件：

```bash
# Python
python -m http.server 8080

# Node.js
npx serve .

# 或直接用瀏覽器開啟 index.html（部分瀏覽器有 CORS 限制）
```

## 專案結構

```
jizhi-chess/
├── index.html              # 遊戲主體（全部含在一個 HTML）
├── .github/
│   └── workflows/
│       └── deploy.yml      # GitHub Pages 自動部署
└── README.md
```

## 遊戲規則

- 您執**紅方**，AI 執**黑方**
- 點擊棋子選取（高亮顯示），再點綠色格子落子
- 吃掉對方「將/帥」即獲勝

## 技術細節

- 純 Vanilla JS + Canvas 2D API，無任何外部依賴
- AI：Minimax 演算法 + Alpha-Beta 剪枝
  - 普通模式：搜尋深度 2
  - 困難模式：搜尋深度 3
- 背景：Canvas 程序生成水墨山水（漸層、山脈、松樹、水紋、薄霧、墨點）

## License

MIT © 2024 JizhiChess
