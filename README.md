# Vibe Coding Toolkit

Fluxo real de desenvolvimento assistido por IA — testado em produção.

## 📚 Sobre

O **Vibe Coding Toolkit** é um conjunto de ferramentas e práticas para fazer agentes de IA (Claude Code, Codex) funcionarem como parte do time — não como estagiários hiperativos.

**Características principais:**
- ✅ Sessões persistentes com contexto preservado
- ✅ Agentes especializados para tarefas específicas
- ✅ Boas práticas de lint e validação
- ✅ Lições aprendidas registradas e reaproveitáveis

## 🚀 Instalação

### Opção 1: Docker (Recomendado)

```bash
docker pull jeanrauwers/vibe-coding-toolkit:latest
docker run -d --name vibe-toolkit -p 3000:3000 jeanrauwers/vibe-coding-toolkit:latest
```

### Opção 2: Local

```bash
git clone https://github.com/jeanrauwers/vibe-coding-toolkit.git
cd vibe-coding-toolkit
npm install
npm start
```

## 🔌 Plugins e CLIs

Verifique a documentação completa em `docs/01-installation.md`

### Plugins do Claude Code
- Superpowers
- Ponytail
- Graphify

### CLIs Independentes
- agent-browser
- Graphviz

## 📖 Documentação

- [01-Installation](docs/01-installation.md) - Instalação e configuração
- [02-Playbook](docs/02-playbook-onboarding.md) - Onboarding passo a passo

## 🛠️ Scripts Disponíveis

```bash
npm start          # Iniciar em produção
npm run dev        # Iniciar com watch
npm run build      # Build completo
npm test           # Rodar testes
```

## 📝 License

MIT License - feito para Claude Code e Codex

---

**Feito no Brasil** 🇧🇷 por Matheus Gomes

[![Feito para Claude Code](https://img.shields.io/badge/feito%20para-Claude%20Code-CC785C.svg)](https://docs.claude.com)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://github.com/jeanrauwers/vibe-coding-toolkit/pulls)
