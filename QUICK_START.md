# 🚀 快速開始指南 - Spring Boot Demo Application

## ✨ 已完成的工作

### 核心問題修復 ✅

| 問題 | 原因 | 修復方案 |
|------|------|--------|
| **localhost:8080無法連接** | `pom.xml`中`spring-boot-starter-web`被設為`test` scope | ✅ 移除錯誤的scope配置 |
| **類名大小寫不一致** | 多個文件使用小寫`player`而實體是大寫`Player` | ✅ 統一所有引用為`Player` |
| **Player實體缺陷** | 缺少getter/setter，字段不匹配 | ✅ 使用Lombok自動生成方法 |
| **HTML模板出錯** | 模板引用不存在的字段(name, email) | ✅ 更新為實際字段(account, nickname等) |

### 建立的檔案和資料夾 ✅

**新增文件**:
- ✅ `.mvn/wrapper/maven-wrapper.properties` - Maven配置
- ✅ `mvnw.cmd` - Windows Maven啟動腳本  
- ✅ `run.cmd` - Windows運行腳本
- ✅ `run.ps1` - PowerShell運行腳本
- ✅ `diagnostic.cmd` - 環境診斷腳本
- ✅ `STARTUP_GUIDE.md` - 完整啟動指南
- ✅ `QUICK_START.md` - 本文件

**修復的文件**:
- ✅ `src/main/java/com/example/demo/HelloController.java`
- ✅ `src/main/java/com/example/demo/controller/UserController.java`
- ✅ `src/main/java/com/example/demo/service/UserService.java`
- ✅ `src/main/java/com/example/demo/repository/UserRepository.java`
- ✅ `src/main/java/com/example/demo/entity/Player.java`
- ✅ `src/main/resources/templates/index.html`
- ✅ `pom.xml`

---

## 🎯 環境檢查結果

運行 `.\diagnostic.cmd` 的結果:

```
✅ Java: OpenJDK 25.0.3 LTS (已安裝)
⚠️  Maven: 未安裝 (需要安裝或使用Wrapper)
⚠️  MySQL: 連接失敗 (需要啟動服務)
✅ 項目結構: 完整
✅ 端口8080: 可用
```

---

## 📋 立即開始 (3步驟)

### 步驟 1️⃣: 安裝Maven (如果未安裝)

**Windows**:
```powershell
# Option A: 手動下載並安裝
1. 下載: https://maven.apache.org/download.cgi
2. 解壓到: C:\Program Files\apache-maven-3.9.x
3. 添加環境變數:
   - MAVEN_HOME = C:\Program Files\apache-maven-3.9.x
   - PATH += %MAVEN_HOME%\bin
4. 重啟PowerShell驗證: mvn -version

# Option B: 使用Chocolatey (如果已安裝)
choco install maven

# Option C: 使用scoop
scoop install maven
```

### 步驟 2️⃣: 啟動MySQL服務

確保MySQL服務正在運行，並且:
- 用戶名: `root`
- 密碼: `Shadowr1120`
- 數據庫: `smartchess` (自動創建)

```powershell
# Windows服務方式
# 在Services中找到MySQL8.0，確認服務已啟動

# Or 驗證連接:
mysql -u root -p
# 輸入密碼: Shadowr1120
```

### 步驟 3️⃣: 編譯並運行

```powershell
cd D:\桌面暫存放資料\JavaProjects\0701AI

# 清理並構建 (首次或更新後)
mvn clean install -DskipTests

# 運行應用 (推薦)
mvn spring-boot:run

# 或構建JAR後運行
mvn clean package -DskipTests
java -jar target/smartchess-1.0.0.jar
```

**預期輸出**:
```
Started DemoApplication in X.XXX seconds (JVM running for X.XXX)
```

---

## 🌐 驗證應用是否運行

運行後，在瀏覽器或終端訪問:

```bash
# 1. 健康檢查 (推薦首先測試)
curl http://localhost:8080/api/health
# 預期返回: "Demo API Running"

# 2. 首頁
http://localhost:8080/

# 3. API列表
curl http://localhost:8080/api/users
# 返回: [] (空列表或現有玩家)
```

**如果一切正常** ✅:
```
✨ 恭喜! localhost:8080 現在可以訪問了
API已啟動並運行在: http://localhost:8080
```

---

## 😞 常見問題

### 問題: "mvn找不到"

**解決方案**:
```powershell
# 檢查Maven是否在PATH中
$env:PATH

# 如果未安裝，安裝Maven:
# https://maven.apache.org/download.cgi

# 或使用Maven Wrapper:
.\mvnw spring-boot:run  # 自動下載
```

### 問題: "Connection refused: localhost:8080"

**檢查清單**:
- ✅ 應用是否正在運行 (看控制台)
- ✅ 端口8080是否被其他應用佔用
  ```powershell
  netstat -ano | find ":8080"
  ```
- ✅ 防火牆是否阻止了連接
- ✅ 重新啟動應用

### 問題: "java.sql.SQLException: Communications link failure"

**解決方案**:
1. **啟動MySQL服務**
   ```powershell
   # Windows服務管理中找到MySQL服務並啟動
   # 或使用命令行
   ```

2. **驗證連接**
   ```powershell
   mysql -u root -p
   ```

3. **檢查application.yml**:
   ```yaml
   datasource:
     url: jdbc:mysql://localhost:3306/smartchess
     username: root
     password: Shadowr1120
   ```

4. **創建數據庫** (如果不存在):
   ```sql
   CREATE DATABASE smartchess DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;
   ```

---

## 🎓 API 端點參考

| 方法 | URL | 功能 | 範例 |
|------|-----|------|-----|
| GET | `/` | 首頁 | `http://localhost:8080/` |
| GET | `/api/health` | 健康檢查 | `curl http://localhost:8080/api/health` |
| GET | `/api/users` | 獲取所有玩家 | `curl http://localhost:8080/api/users` |
| GET | `/api/users/{id}` | 獲取單個玩家 | `curl http://localhost:8080/api/users/1` |
| POST | `/api/users` | 創建玩家 | `curl -X POST -H "Content-Type: application/json" ...` |
| PUT | `/api/users/{id}` | 更新玩家 | `curl -X PUT ...` |
| DELETE | `/api/users/{id}` | 刪除玩家 | `curl -X DELETE ...` |

---

## 📁 關鍵文件位置

```
D:\桌面暫存放資料\JavaProjects\0701AI\
├── pom.xml                          (Maven配置 - 已修復)
├── src/main/
│   ├── java/com/example/demo/
│   │   ├── DemoApplication.java      (主入口)
│   │   ├── HelloController.java      (首頁)
│   │   ├── controller/
│   │   │   └── UserController.java   (API控制器 - 已修復)
│   │   ├── entity/Player.java        (實體 - 已修復)
│   │   ├── service/UserService.java  (服務 - 已修復)
│   │   └── repository/               (數據訪問)
│   └── resources/
│       ├── application.yml           (配置)
│       ├── templates/index.html      (首頁模板 - 已修復)
│       └── static/css/style.css      (樣式)
├── STARTUP_GUIDE.md                 (詳細指南)
├── QUICK_START.md                   (本文件)
├── diagnostic.cmd                   (診斷工具)
└── mvnw.cmd                         (Maven Wrapper)
```

---

## 🔧 進階操作

### 創建自定義玩家

```bash
curl -X POST http://localhost:8080/api/users \
  -H "Content-Type: application/json" \
  -d '{
    "account": "player1",
    "password": "password123",
    "nickname": "Player Name",
    "level": 10,
    "exp": 1000
  }'
```

### 查看編譯日誌

```powershell
# 詳細編譯日誌
mvn clean compile -X

# 只看錯誤
mvn clean install 2>&1 | grep ERROR
```

### 測試代碼

```powershell
# 運行單元測試
mvn test

# 跳過測試構建
mvn clean install -DskipTests
```

---

## 💡 下一步建議

1. **✅ 驗證連接**: 訪問 `http://localhost:8080/api/health`
2. **✅ 檢查日誌**: 查看控制台輸出是否有錯誤
3. **✅ 探索API**: 使用Postman或curl測試API
4. **✅ 添加數據**: 在MySQL中手動添加玩家數據
5. **✅ 開發功能**: 修改代碼並測試

---

## 📞 需要幫助?

- 📖 完整指南: 查看 `STARTUP_GUIDE.md`
- 🔍 診斷: 運行 `.\diagnostic.cmd`
- 📝 錯誤查詢: 查看控制台輸出或日誌文件
- 🌐 官方文檔: 
  - Spring Boot: https://spring.io/projects/spring-boot
  - Maven: https://maven.apache.org
  - MySQL: https://dev.mysql.com/doc/

---

**祝您使用愉快! 🎉**

如有任何問題，請參考詳細的 `STARTUP_GUIDE.md` 文件。
