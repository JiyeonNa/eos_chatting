/* 필요한 module, router 폴더 import */
const express = require('express');
const mysql = require('mysql');
const path = require('path');
const morgan = require('morgan');
const bodyParser = require('body-parser');
const dotenv = require('dotenv');
const cors = require('cors');
const router = require('./routes');

/* app이라는 이름의 express 객체 생성 */
var app = express();

/* app 객체를 이용해서 서버 통신에 필요한 미들웨어 등록 */
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(morgan('dev'));
app.use(cors());

/* port 번호 설정 */
const port = process.env.PORT || 8000;

/* 주소 뒤에 router 등록 */
app.use('/', router);

/* env 파일을 불러와서 그 안에 있는 내용들을 이용해서 MySQL 연결 */
dotenv.config();

const connectionPool = mysql.createPool({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PW,
    port: process.env.DB_PORT,
    database: process.env.DB_NAME,
    insecureAuth: true,
});

/* MySQL 연결하는 함수 구현 */
exports.getConnectionPool = (callback) => {
    connectionPool.getConnection((err, conn) => {
        if(!err) callback(conn);
        console.log(err)
    })
}

/* 서버 실행 */
app.listen(8000, () => {
    console.log('hello listening on' ,port);
})
