# Demo Spring Boot + MySQL MVP

簡要說明：這是一個最小可運行的 Spring Boot（Java 17）範例專案，展示 `User` 的 CRUD API，使用 MySQL 作為資料庫。

快速啟動

1. 啟動 MySQL（透過 Docker Compose / Docker Compose V2）：

```bash
docker compose up -d
```

2. 建置並啟動 Spring Boot 應用：

```bash
mvn clean package
mvn spring-boot:run
```

或：

```bash
java -jar target/demo-0.0.1-SNAPSHOT.jar
```

預設設定（可在 `src/main/resources/application.properties` 調整）:

- JDBC URL: `jdbc:mysql://localhost:3306/demo`
- username: `root` / password: 在 `application.properties` 中設定

API 範例

- 建立 user:

```bash
curl -s -X POST http://localhost:8080/api/users \
  -H "Content-Type: application/json" \
  -d '{"name":"Alice","email":"alice@example.com"}'
```

- 取得所有 user:

```bash
curl http://localhost:8080/api/users
```

- 取得單一 user:

```bash
curl http://localhost:8080/api/users/1
```

- 健康檢查 API:

```bash
curl http://localhost:8080/api/health
```

測試

可用 `mvn test` 執行測試。

資料庫初始化

`create-database.sql` 會在 container 啟動時被執行，會建立 `demo` 資料庫並建立 `demo_user` 帳號。

下一步建議

- 加上 DTO 與 input validation 回傳詳細錯誤
- 加上 Flyway 管理 schema 變更
- 新增 CI（GitHub Actions）
