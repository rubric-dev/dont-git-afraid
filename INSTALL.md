# Don't Git Afraid — 설치 가이드

## Claude Code에서 쓰기 (1분)

### 1. 프로젝트에 스킬 폴더 복사

```bash
# 프로젝트 폴더에서
mkdir -p .claude/skills
cp -r dont-git-afraid .claude/skills/
```

### 2. CLAUDE.md에 규칙 추가

프로젝트 루트의 `CLAUDE.md` 파일에 아래 내용을 추가하세요:

```markdown
## Git 규칙
사용자에게 Git 작업 상태를 설명·보고·확인할 때는 반드시
`dont-git-afraid` 스킬의 용어 변환 규칙을 따르세요
(commit→세이브, push→올리기, branch→갈래 등 + 이모지).

단, Bash 도구로 실제 git 명령을 실행할 때는 원래 git 용어를
그대로 사용합니다 (`git commit`, `git push`, ...).
```

### 3. 테스트

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

## 전역 설치 (모든 프로젝트에서 사용)

```bash
mkdir -p ~/.claude/skills
cp -r dont-git-afraid ~/.claude/skills/
```

전역 `CLAUDE.md`(~/.claude/CLAUDE.md)에도 위의 Git 규칙을 추가하세요.
