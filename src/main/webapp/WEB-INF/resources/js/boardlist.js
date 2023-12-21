"use strict";
// Ajax 는 두 종류의 명칭으로 쓰인다
// Ajax 라는 기본 통신형 대분류 명칭 - 우리가 쓸것
// Jquery 의 Ajax 기술의 명칭이 Ajax
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __generator = (this && this.__generator) || function (thisArg, body) {
    var _ = { label: 0, sent: function() { if (t[0] & 1) throw t[1]; return t[1]; }, trys: [], ops: [] }, f, y, t, g;
    return g = { next: verb(0), "throw": verb(1), "return": verb(2) }, typeof Symbol === "function" && (g[Symbol.iterator] = function() { return this; }), g;
    function verb(n) { return function (v) { return step([n, v]); }; }
    function step(op) {
        if (f) throw new TypeError("Generator is already executing.");
        while (g && (g = 0, op[0] && (_ = 0)), _) try {
            if (f = 1, y && (t = op[0] & 2 ? y["return"] : op[0] ? y["throw"] || ((t = y["return"]) && t.call(y), 0) : y.next) && !(t = t.call(y, op[1])).done) return t;
            if (y = 0, t) op = [op[0] & 2, t.value];
            switch (op[0]) {
                case 0: case 1: t = op; break;
                case 4: _.label++; return { value: op[1], done: false };
                case 5: _.label++; y = op[1]; op = [0]; continue;
                case 7: op = _.ops.pop(); _.trys.pop(); continue;
                default:
                    if (!(t = _.trys, t = t.length > 0 && t[t.length - 1]) && (op[0] === 6 || op[0] === 2)) { _ = 0; continue; }
                    if (op[0] === 3 && (!t || (op[1] > t[0] && op[1] < t[3]))) { _.label = op[1]; break; }
                    if (op[0] === 6 && _.label < t[1]) { _.label = t[1]; t = op; break; }
                    if (t && _.label < t[2]) { _.label = t[2]; _.ops.push(op); break; }
                    if (t[2]) _.ops.pop();
                    _.trys.pop(); continue;
            }
            op = body.call(thisArg, _);
        } catch (e) { op = [6, e]; y = 0; } finally { f = t = 0; }
        if (op[0] & 5) throw op[1]; return { value: op[0] ? op[1] : void 0, done: true };
    }
};
// XMLHttpRequest -> 클래스 new XMLHttpRequest()
// fetch -> 함수 fetch(url)
// fetch 는 url 과 option 을 넣으면 해당하는 url 로 request 를 보내고 response 를 받는 일방형 통신 기술
// 페이지 이동이 특별히 필요하지 않으면 없다
// fetch 는 결과값으로 무엇을 돌려주는가
// 결과값을 Promise 형태로 받아오기 때문에
function ajax(url, option) {
    return __awaiter(this, void 0, void 0, function () {
        return __generator(this, function (_a) {
            return [2 /*return*/, fetch(url, option).then(function (res) { return res.json(); })];
        });
    });
}
// filter - fetch 랑 함께 쓰는
// form -> submit
// formdata 가 파일을 전송할때 자동적으로 boundary 작업 -> 경계선
// Encrypt Data -> 암호화 정보
// AjaxFilter 에 password 로 Hello 를 보내면
// Hello+EncodeData 를 전송
// AjaxFilter 는  +EncodeData 를 떼고 Hello 만 출력
var form = new FormData();
form.append("password", "Hello+EncodeData");
ajax("/api/boardlist", {
    method: "POST",
    body: form,
    // headers:{
    //     "Content-Type": "application/json",
    //     "Authorization": "ABCD", // 인증에 성공했다고 알려주기 위한 토큰 키 값 보안에 쓰임
    //    // accept:  "application/json", // 서버에서 받아올거 예측 보통 이미지 같은거 처리할때
    //    // "User-Agent": "robots", // IOS, WINDOW, ANDROID 
    // },
    // // body: new FormData()
    // mode: "cors", // 고정이라 볼필요 없다 잘 안바꿈
    // cache: "default", // 불필요한 ajax 의 캐쉬값을 저장할거냐
    //     // no-store 만들지 마, reload 있어도 새로 요청, no-cache, force-cache 저장 후 유효성 검사 안함 페이지 갱신이 안됨
    //     // only-if-cache 처음 값을 고정하고 안바꾸겠다
    // redirect: "follow",    
    //     // follow, error 안가고 에러 띄움, menual 안가고 수동으로
    // referrer: "no-referrer",
    //     // strict-origin 같은 도메인이면 보내 줄거야, unsafe 몽땅 다 보낼거야
}).then(function (json) {
    console.log(json);
    var boards = document.querySelector("#boards");
    var template = document.querySelector("#boards template");
    if (template) {
        for (var _i = 0, _a = json.data; _i < _a.length; _i++) {
            var data = _a[_i];
            template.content.querySelector(".id").innerHTML = data.id;
            template.content.querySelector(".title").innerHTML = data.title;
            template.content.querySelector(".author").innerHTML = data.boardUser.name;
            var div = document.createElement("div");
            div.innerHTML = template.innerHTML;
            if (boards) {
                boards.appendChild(div);
            }
        }
    }
});
// fetch("/api/boardlist",{
//     method: "POST",
// }).then( (res) => res.json())
//     .then((json)=>{
//         console.log(json);
// });
