# Don't Git Afraid — 설치 가이드

> Git이 무서운 분들을 위한 스킬이니까, 설치도 Git 없이 할 수 있게 만들었어요. 🙂

## 🟢 방법 1 — ZIP 다운로드 (Git 몰라도 OK, 추천)

### 1. GitHub에서 ZIP 받기

1. 이 저장소 GitHub 페이지로 이동
2. 초록색 **`<> Code`** 버튼 클릭
3. 맨 아래 **Download ZIP** 클릭
4. 다운로드 받은 `dont-git-afraid-main.zip` 압축 풀기

### 2. `dont-git-afraid` 폴더를 `.claude/skills/`에 넣기

압축을 풀면 `dont-git-afraid-main` 폴더 안에 `dont-git-afraid` 폴더가 들어있어요.
**그 안쪽 `dont-git-afraid` 폴더**를 통째로 옮겨주세요.

**A. 이 프로젝트에서만 쓰기**

```
내 프로젝트/
└── .claude/
    └── skills/
        └── dont-git-afraid/   ← 여기에 넣기
            ├── SKILL.md
            ├── git-status.sh
            └── ...
```

`.claude/skills/` 폴더가 없으면 직접 만들어주세요.

**B. 모든 프로젝트에서 쓰기 (전역 설치)**

홈 폴더의 `~/.claude/skills/` 안에 넣으면 어떤 프로젝트에서 Claude Code를 켜도 자동으로 적용돼요.

```
~/.claude/skills/dont-git-afraid/
```

### 3. CLAUDE.md에 규칙 추가

프로젝트 루트의 `CLAUDE.md` 파일(없으면 새로 만들기)에 아래 내용을 붙여넣으세요.
전역 설치라면 `~/.claude/CLAUDE.md`에 넣으면 돼요.

```markdown
## Git 규칙
사용자에게 Git 작업 상태를 설명·보고·확인할 때는 반드시
`dont-git-afraid` 스킬의 용어 변환 규칙을 따르세요
(commit→세이브, push→올리기, branch→사본 등 + 이모지).

단, Bash 도구로 실제 git 명령을 실행할 때는 원래 git 용어를
그대로 사용합니다 (`git commit`, `git push`, ...).
```

### 4. 테스트

Claude Code에서 아래처럼 말해보세요:

```
지금 내 Git 상태 어때?
```

이렇게 나오면 성공:

```
═══════════════════════════════════════
✨  깨끗 — 다 저장돼있고 GitHub이랑 똑같아요
═══════════════════════════════════════

📂 작업 폴더  →  🧺 담아둠  →  💾 세이브  →  ☁️ GitHub ✓
```

---

## 🛠️ 방법 2 — 터미널 / Git이 익숙하다면

```bash
# 프로젝트 폴더에서
git clone https://github.com/rubric-dev/dont-git-afraid.git /tmp/dgaf
mkdir -p .claude/skills
cp -r /tmp/dgaf/dont-git-afraid .claude/skills/
```

전역 설치는 `.claude/skills/` 대신 `~/.claude/skills/`를 쓰면 됩니다.

그다음 위의 **3. CLAUDE.md에 규칙 추가** 와 **4. 테스트** 단계는 동일해요.
