# 배포 연동 가이드

Vercel이나 Netlify 같은 배포 서비스와 GitHub을 연결하면, 업로드(push)만 하면 자동으로 사이트가 업데이트되는 구조.

## 배포 흐름 설명

배포 관련 작업을 할 때는 전체 흐름을 먼저 보여주세요:

```
🚀 배포(Deploy) = 내 코드를 인터넷에 공개하는 것

전체 흐름:

   📂 코드 수정
      ↓
   📦 포장 (git add)
      ↓
   💾 세이브 포인트 (git commit)
      ↓
   ☁️ GitHub에 업로드 (git push)
      ↓
   🚀 자동 배포! ← Vercel/Netlify가 알아서 해줘요
      ↓
   🌐 사이트 업데이트 완료!

즉, 여러분은 업로드(push)만 하면 끝!
Vercel/Netlify가 GitHub을 감시하고 있다가 자동으로 배포해요.
```

## 배포 후 상태 확인

```
✅ 클라우드 업로드 완료! + 🚀 자동 배포 시작됨

   💻 ═══ ✓ ═══ ☁️ GitHub ═══ 🚀 ═══ 🌐

Vercel/Netlify가 자동으로 배포를 시작했어요.
보통 1~3분 안에 사이트가 업데이트돼요.

배포 상태는 GitHub 저장소 또는 Vercel/Netlify 대시보드에서 확인할 수 있어요.
```

## 배포 실패 시

```
⚠️ 배포가 실패할 수 있는 경우

업로드(push)는 성공했지만 배포가 실패할 수 있어요.
이건 Git 문제가 아니라 코드 문제예요:

   ❌ 빌드 에러 — 코드에 문법 오류가 있을 때
   ❌ 환경 변수 누락 — Vercel/Netlify에 .env 값을 안 넣었을 때
   ❌ 의존성 문제 — package.json에 빠진 패키지가 있을 때

배포 로그를 보면 원인을 알 수 있어요.
Vercel: vercel.com/dashboard
Netlify: app.netlify.com
```
