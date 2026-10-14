# HKRacing.live (AI 馬經) — Hong Kong Horse Racing MCP Server

**Hong Kong horse racing data for AI assistants.** Ask Claude, ChatGPT, Grok, Cursor or any MCP client about Sha Tin and Happy Valley race cards, AI win probabilities, odds, results and dividends, horse form, jockey and trainer statistics, draw statistics and a public AI track record — in English or Chinese.

- **Endpoint:** `https://hkracing.live/mcp` (Streamable HTTP, read-only, no sign-in, free)
- **Website:** [hkracing.live](https://hkracing.live) · 繁體中文 [hkracing.live/zh-hk](https://hkracing.live/zh-hk) · 简体中文 [hkracing.live/zh-cn](https://hkracing.live/zh-cn)
- **Official MCP Registry:** `live.hkracing/mcp`
- **By:** [OddsFlow](https://www.oddsflow.ai) — sports-analytics AI

> HKRacing.live compiles the Hong Kong Jockey Club's public data, adds statistics and the horse-strength AI model, and makes it usable by anyone — on the website, and directly inside your AI assistant.

## Connect

### Claude (claude.ai / Claude Desktop)
Add a **custom connector** (remote MCP server) with the URL `https://hkracing.live/mcp`. No authentication is needed.

Or in `claude_desktop_config.json` (via [mcp-remote](https://www.npmjs.com/package/mcp-remote)):

```json
{
  "mcpServers": {
    "hkracing": { "command": "npx", "args": ["-y", "mcp-remote", "https://hkracing.live/mcp"] }
  }
}
```

### ChatGPT
In developer mode, add a custom MCP connector with the server URL `https://hkracing.live/mcp` and no authentication.

### Grok
Add a remote MCP connector with the URL `https://hkracing.live/mcp` (no authentication).

### Cursor / VS Code / other clients
```json
{ "mcpServers": { "hkracing": { "url": "https://hkracing.live/mcp" } } }
```

More examples in [`examples/`](examples/).

## Tools

| Tool | What it returns |
|---|---|
| `get_meeting` | A race meeting: every race with post time, class, distance, course, status, AI top pick, and the first three once run. No date = next meeting. |
| `get_race` | One race: full field with draw, jockey, trainer, weight, rating, win odds, **AI win probability and rank**; after the race, positions, margins and HKJC dividends. |
| `get_tips` | AI top four for every race at a meeting, with how the AI top pick was settled. |
| `get_track_record` | The public record of every AI top pick ($10 win + $10 place), sealed before the off, losses included, vs. backing the favourite. |
| `search` | Find horses, jockeys and trainers by Chinese name, English name or brand number (e.g. `H464`). |
| `get_horse` | Horse profile: trainer, rating, pedigree, career, last 10 runs and a written form summary. |
| `get_person` | Jockey or trainer season statistics, strike rates, top partners and recent rides. |
| `get_standings` | Jockey or trainer championship table, with the last 30 days. |
| `get_partnership` | Jockey–trainer partnership record over the last two seasons. |
| `get_draw_stats` | Win and place rates by draw for a venue, distance and rail (A, B+2, C+3, AWT…). |

Every tool takes an optional `lang`: `en` (default) or `zh` (Traditional Chinese). Every result ends with the matching page on hkracing.live — please cite it.

AI win probabilities come from the horse-strength model v1. They are generated about 70 minutes before each race and sealed at the off; the public record counts losses too.

## Try asking

- "What are the AI tips for the next Sha Tin meeting?"
- "Show me race 5 at Happy Valley on Wednesday with the AI win chances."
- "How has Zac Purton done with John Size this season?"
- "Which draws do best over 1200m on the C+3 course at Happy Valley?"
- 「機械騎士最近狀態點樣？」
- 「今季騎師王排名？」
- 「AI 首選嘅公開戰績係幾多？」

## Sample output

```
# Happy Valley Race 3 2026-10-14 19:35 HKT
ELGIN HANDICAP · Class 4 · 1650m · Turf "A" Course · GOOD
Status: result (AI predictions sealed at the off)

Race 3 at Happy Valley on 14 Oct 2026: Class 4, 1650m on the Turf "A" Course, 10 runners.
No. 2 SHOOTING TO TOP won under Z Purton at 4.
AI top pick No. 9 finished 4th: win −$10, place −$10 ($10 stakes).

| No | Horse | Draw | Jockey | Trainer | Wt | Rtg | Win odds | AI win % | AI rank | Pos | Margin |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 2 | SHOOTING TO TOP | 2 | Z Purton | W K Mo | 134 | — | 3.9 | 15% | 2 | 1 | — |
| 10 | PRESTIGE RICKY | 1 | K Teetan | P F Yiu | 119 | — | 4.9 | 9% | 7 | 2 | N |
| 1 | EXCEED THE LIMIT | 8 | L Hewitson | C S Shum | 135 | — | 12.0 | 6% | 10 | 3 | N |
...
Page: https://hkracing.live/results/2026-10-14/hv/3
```

## How the AI pick and record work

- The horse-strength model v1 estimates each runner's chance of winning from pre-race information about 70 minutes before the off. It does not use the odds.
- Predictions are **sealed at the off** and never changed; only the settlement is added afterwards.
- The record backs every AI top pick with $10 win and $10 place at Hong Kong Jockey Club dividends, shown next to backing the favourite. The sample is still small.

## 中文說明

**HKRacing.live（AI 馬經）MCP**：由 OddsFlow 出品，讓你喺 Claude、ChatGPT、Grok 等 AI 助手入面直接查香港賽馬數據——排位表、AI 勝率、賠率、賽果、派彩、馬匹往績、騎師／練馬師成績、騎練組合、檔位統計，同埋開跑前封存、輸贏照登嘅 AI 公開戰績。

- 服務網址：`https://hkracing.live/mcp`（免費、只讀、毋須登入）
- 網站：[hkracing.live/zh-hk](https://hkracing.live/zh-hk)（繁體）· [hkracing.live/zh-cn](https://hkracing.live/zh-cn)（简体）
- 所有工具都可以加 `lang: "zh"` 用繁體中文回覆；支援中文馬名、英文馬名同烙號。

## Data and disclaimer

Data comes from the Hong Kong Jockey Club's public information, compiled by OddsFlow; the Jockey Club's official figures always prevail. HKRacing.live provides information and analysis only — it takes no bets and is not betting advice. In Hong Kong, betting is legal only through the Hong Kong Jockey Club. Please bet responsibly.

Contact: support@hkracing.live

## License

Documentation and examples in this repository: MIT. The hosted service and its data are provided by OddsFlow under the [hkracing.live](https://hkracing.live) terms.

