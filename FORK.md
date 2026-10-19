# profLewis fork

Fork of [timlaing/music-assistant-alexa-api](https://github.com/timlaing/music-assistant-alexa-api) at **1.3.6**,
branch `proflewis`. Identical to upstream except:

- **Built locally** (no `image:` in config.yaml): Supervisor builds the Dockerfile on the HA host.
- **Skill code from the fork**: the Dockerfile replaces the skill image's `/app/src` + `/app/app` with
  [profLewis/music-assistant-alexa-skill](https://github.com/profLewis/music-assistant-alexa-skill) (branch
  `proflewis`, base v1.4.1), pinned by `ARG SKILL_REF=<commit>`. That repo's golden-response tests hold the fork
  to upstream's exact replies except for documented changes.
- **One-time settings import**: if `/share/ma_alexa_import/` exists and this add-on has no settings yet, its files
  are copied into `/data` and the folder is deleted - so the fork takes over the deployed skill without a new
  Amazon login.

Install: Settings -> Add-ons -> Add-on Store -> Repositories -> `https://github.com/profLewis/music-assistant-alexa-api`
(the store uses the default branch, so `proflewis` is set as default on the fork).

To ship a skill change: commit on the skill fork, then bump `SKILL_REF` here and the `-pl.N` version.
