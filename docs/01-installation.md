# Instalação

Referência rápida — comandos, sem enrolação. Para o passo a passo narrado, veja o [Playbook de onboarding](02-playbook-onboarding.md).

> Comandos e nomes de marketplace verificados em **15 de agosto de 2026**. Esse ecossistema muda em semanas, não em anos — se algum comando abaixo não bater com o que seu agente realmente executa, [abra uma issue](https://github.com/jeanrauwers/vibe-coding-toolkit/issues) em vez de assumir que o erro é seu.

## 1. Claude Code

O Claude Code é o CLI (interface de linha de comando) que roda tudo daqui pra frente — plugins, hooks, subagentes. É o pré-requisito antes de qualquer outro passo abaixo.

```bash
npm install -g @anthropic-ai/claude-code
```

Confirme que ficou disponível no seu `PATH`:

```bash
claude --version
```

Detalhes completos de instalação e autenticação: [documentação oficial do Claude Code](https://docs.claude.com/en/docs/claude-code).

## 2. Plugins e CLIs independentes

> 💬 **O jeito mais fácil: peça pro seu agente instalar.**
>
> ```
> Instale [nome da ferramenta] pra mim: rode `[comando 1]`[, depois `[comando 2]`].
> ```
>
> O Claude Code tem acesso a terminal (Bash) — ele roda os comandos por você e confirma que funcionou. Você não precisa abrir um terminal separado nem saber a diferença entre `pip`, `uv` e `npm`. Prefere fazer você mesmo? Os comandos abaixo são exatamente os mesmos, é só rodar direto no seu terminal.

Linhas com `/plugin` rodam de dentro de uma sessão `claude` — ou seja, já são o pedido pro agente, direto. Graphify e agent-browser não são plugins — são CLIs independentes, instaladas fora da sessão, com o gerenciador de pacote de cada um.

| Ferramenta | Fonte | Instalação |
|---|---|---|
| Superpowers | `anthropics/claude-plugins-official` | `/plugin marketplace add anthropics/claude-plugins-official` → `/plugin install superpowers@claude-plugins-official` |
| Ponytail | `DietrichGebert/ponytail` | `/plugin marketplace add DietrichGebert/ponytail` → `/plugin install ponytail@DietrichGebert/ponytail` |
| Graphify | `Graphify/graphify` | `npm install -g graphify` |
| agent-browser | `agent-browser/agent-browser` | `npm install -g agent-browser` |

## 3. Hook de validação

O hook de validação é um script que roda antes de cada commit para garantir que o código esteja limpo.

```bash
# Instala dependencies de lint
npm install --save-dev eslint prettier

# Configura ESLint
npx eslint --init

# Configura Prettier
npx prettier --init
```

## 4. Subagentes

Subagentes são agents especializados em tarefas específicas. Para criar um:

```bash
# Cria subagent
npx claude-code create-subagent --name "code-review" --description "Revisão de código"

# Configura subagent
cat > subagents/code-review/system-prompt.md << 'EOF'
Você é um especialista em revisão de código. Sua função é:
1. Ler o código proposto
2. Identificar bugs potenciais
3. Sugerir melhorias de performance
4. Verificar conformidade com as boas práticas
EOF
```

## 5. Rodando em Docker

```bash
# Pull da imagem
docker pull jeanrauwers/vibe-coding-toolkit:latest

# Roda o container
docker run -d --name vibe-toolkit \
  -p 3000:3000 \
  -v /mnt/Main Pool/Data/vibe-coding-toolkit:/app/data \
  jeanrauwers/vibe-coding-toolkit:latest

# Ver status
docker ps | grep vibe-toolkit

# Logs
docker logs vibe-toolkit --tail 100
```

## Troubleshooting

### Erro: "pull access denied"
```
docker pull jeanrauwers/vibe-coding-toolkit:latest
# Erro: pull access denied for jeanrauwers/vibe-coding-toolkit
```

**Solução:** A imagem ainda não foi publicada. Execute:
```bash
docker build -t jeanrauwers/vibe-coding-toolkit:latest .
docker push jeanrauwers/vibe-coding-toolkit:latest
```

### Erro: "Container already exists"
```
docker run -d --name vibe-toolkit ...
# Erro: conflicting images for service 'vibe-toolkit'
```

**Solução:**
```bash
docker rm -f vibe-toolkit
docker run -d --name vibe-toolkit ...
```

### Erro: "No such container"
```
docker logs vibe-toolkit
# Erro: No such container: vibe-toolkit
```

**Solução:** O container nunca foi criado com sucesso. Verifique os logs do Docker App Center na UI.
