# 🚀 Spring Boot Demo Application - 啟動指南

## ✓ 已修復的問題

### 1. **Web依賴配置錯誤** (主要問題)
- **問題**: `pom.xml`中的`spring-boot-starter-web`被設置為`test` scope
- **原因**: 導致Web伺服器無法啟動，無法綁定到localhost:8080
- **修復**: 移除錯誤的`<scope>test</scope>`配置

### 2. **類名大小寫不一致**
- **修復文件**:
  - `HelloController.java` - 修復了`player` → `Player`
  - `UserService.java` - 修復了所有引用
  - `UserRepository.java` - 修復了泛型參數
  - `UserController.java` - 修復了所有返回類型

### 3. **Player實體缺陷**
- **問題**: 缺少getter/setter方法，字段不完整
- **修復**: 使用Lombok註解(`@Data`, `@NoArgsConstructor`, `@AllArgsConstructor`)自動生成方法

### 4. **HTML模板更新**
- **修復**: 更新`index.html`以匹配Player實體的實際字段(account, password, nickname等)

### 5. **Maven Wrapper設置**
- **創建**: `.mvn/wrapper/maven-wrapper.properties` - Maven配置文件
- **創建**: `mvnw.cmd` - Windows Maven啟動腳本

---

## 📋 必要條件

### 系統需求
- **Java JDK 17+** (項目配置為Java 25)
- **Maven 3.6+** (用於構建和運行)
- **MySQL 8.0+** (資料庫服務)

### 驗證環境
```powershell
# 檢查Java版本
java -version

# 檢查Maven版本 (如果已安裝)
mvn -version

# 驗證MySQL服務
mysql -u root -p
```

---

## 🛠️ 安裝步驟

### 步驟 1: 安裝Maven (如果尚未安裝)

**Windows**:
1. 下載: https://maven.apache.org/download.cgi
2. 解壓到 `C:\Program Files\apache-maven-3.9.x`
3. 添加到環境變數:
   - `MAVEN_HOME = C:\Program Files\apache-maven-3.9.x`
   - Path: `%MAVEN_HOME%\bin`
4. 重啟PowerShell並驗證:
   ```powershell
   mvn -version
   ```

### 步驟 2: 驗證MySQL服務

```powershell
# 啟動MySQL服務(如果未自動啟動)
# 檢查application.yml中的數據庫配置:
# - URL: jdbc:mysql://localhost:3306/smartchess
# - Username: root
# - Password: Shadowr1120
```

### 步驟 3: 編譯項目

```powershell
cd "d:\桌面暫存放資料\JavaProjects\0701AI"

# 清理並編譯
mvn clean install -DskipTests

# 或只編譯
mvn clean compile
```

---

## 🎯 運行應用

### 方式 1: 使用Maven (推薦)

```powershell
cd "d:\桌面暫存放資料\JavaProjects\0701AI"
mvn spring-boot:run
```

**預期輸出**:
```
. ____ _ __ _ _
/\\ / ___'_ __ _ _(_)_ __ __ _ \ \ \ \
( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
\\/  ___)| |_)| | | | | || (_| | ) ) ) )
' |____| .__|_| |_|_| |_\__, | / / / /
=========|_|==============|___/=/_/_/_/

[main] Started DemoApplication in 4.231 seconds
```

### 方式 2: 使用編譯済JAR (if available)

```powershell
java -jar target/smartchess-1.0.0.jar
```

### 方式 3: 使用VS Code Run Script

- **Windows**: 執行 `run.cmd`
- **PowerShell**: 執行 `run.ps1`

---

## 🌐 API 端點

應用啟動後，訪問以下端點:

| 方法 | 端點 | 功能 |
|------|------|------|
| GET | `http://localhost:8080/` | 首頁 - 顯示所有玩家 |
| GET | `http://localhost:8080/api/health` | 健康檢查 - 返回 "Demo API Running" |
| GET | `http://localhost:8080/api/users` | 獲取所有玩家(JSON) |
| GET | `http://localhost:8080/api/users/{id}` | 獲取特定玩家 |
| POST | `http://localhost:8080/api/users` | 創建新玩家 |
| PUT | `http://localhost:8080/api/users/{id}` | 更新玩家信息 |
| DELETE | `http://localhost:8080/api/users/{id}` | 刪除玩家 |

### 示例請求

```bash
# 測試健康檢查
curl http://localhost:8080/api/health

# 獲取所有玩家
curl http://localhost:8080/api/users

# 創建新玩家 (在mysql中手動添加)
curl -X POST http://localhost:8080/api/users \
  -H "Content-Type: application/json" \
  -d '{"account":"player1","password":"pass123","nickname":"Player1"}'
```

---

## 🔧 配置文件

### `src/main/resources/application.yml`

```yaml
spring:
  datasource:
    url: jdbc:mysql://localhost:3306/smartchess?useSSL=false&serverTimezone=Asia/Taipei
    username: root
    password: Shadowr1120
  jpa:
    hibernate:
      ddl-auto: update
    show-sql: true

server:
  port: 8080
```

**重要**: 更改此文件中的數據庫憑據以匹配您的MySQL安裝

---

## 🐛 故障排除

### 問題 1: "無法連接到localhost:8080"
**解決方案**:
- ✅ 檢查應用是否正常啟動 (查看控制台輸出)
- ✅ 驗證防火牆設置 (允許port 8080)
- ✅ 檢查是否有其他應用佔用port 8080

### 問題 2: "數據庫連接失敗"
**解決方案**:
- ✅ 驗證MySQL服務正在運行
- ✅ 檢查用戶名和密碼是否正確
- ✅ 確保`smartchess`數據庫存在

### 問題 3: "Maven找不到"
**解決方案**:
- ✅ 安裝Maven: https://maven.apache.org/download.cgi
- ✅ 添加到環境變數PATH
- ✅ 重啟IDE或終端

### 問題 4: "Java版本不匹配"
**解決方案**:
- ✅ 安裝JDK 17或更高版本
- ✅ 驗證: `java -version`

---

## 📁 項目結構

```
0701AI/
├── src/
│   ├── main/
│   │   ├── java/com/example/demo/
│   │   │   ├── DemoApplication.java        (主程序入口)
│   │   │   ├── HelloController.java        (首頁控制器)
│   │   │   ├── config/                     (配置)
│   │   │   ├── controller/                 (API控制器)
│   │   │   ├── entity/Player.java          (玩家實體)
│   │   │   ├── repository/                 (數據訪問層)
│   │   │   ├── service/                    (業務邏輯層)
│   │   │   ├── exception/                  (異常處理)
│   │   │   └── util/                       (工具類)
│   │   └── resources/
│   │       ├── application.yml             (配置文件)
│   │       ├── templates/index.html        (首頁模板)
│   │       └── static/css/style.css        (樣式)
│   └── test/                               (測試代碼)
├── pom.xml                                 (Maven項目配置)
├── docker-compose.yml                      (Docker配置)
├── create-database.sql                     (數據庫初始化腳本)
├── run.cmd                                 (Windows運行腳本)
└── mvnw.cmd                                (Maven Wrapper腳本)
```

---

## 🚀 下一步

1. **安裝Maven** (如果未安裝)
2. **驗證MySQL連接**
3. **運行**: `mvn spring-boot:run`
4. **訪問**: http://localhost:8080/api/health
5. **開發**: 修改代碼並刷新瀏覽器

---

## 📞 支援

如有問題，請檢查:
- 控制台輸出的錯誤信息
- 數據庫連接配置
- 防火牆和端口設置
- Java和Maven版本
