
// Ajax 는 두 종류의 명칭으로 쓰인다
// Ajax 라는 기본 통신형 대분류 명칭 - 우리가 쓸것
// Jquery 의 Ajax 기술의 명칭이 Ajax

// XMLHttpRequest -> 클래스 new XMLHttpRequest()
// fetch -> 함수 fetch(url)

// fetch 는 url 과 option 을 넣으면 해당하는 url 로 request 를 보내고 response 를 받는 일방형 통신 기술
// 페이지 이동이 특별히 필요하지 않으면 없다

// fetch 는 결과값으로 무엇을 돌려주는가
// 결과값을 Promise 형태로 받아오기 때문에

async function ajax(url: string, option?: any) {
    return fetch(url, option).then((res) => res.json());
  }  

// filter - fetch 랑 함께 쓰는

// form -> submit
// formdata 가 파일을 전송할때 자동적으로 boundary 작업 -> 경계선

// Encrypt Data -> 암호화 정보

// AjaxFilter 에 password 로 Hello 를 보내면
// Hello+EncodeData 를 전송
// AjaxFilter 는  +EncodeData 를 떼고 Hello 만 출력

let form: FormData = new FormData();
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

}).then((json) => {
    console.log(json);
    let boards: HTMLElement | null = document.querySelector("#boards");
    let template: HTMLTemplateElement | null =
      document.querySelector("#boards template");
    if (template) {
      for (let data of json.data) {
        template.content.querySelector(".id").innerHTML = data.id;
        template.content.querySelector(".title").innerHTML = data.title;
        template.content.querySelector(".author").innerHTML = data.boardUser.name;
        let div: HTMLElement | null = document.createElement("div");
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

