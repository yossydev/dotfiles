# Makefile

# 正しいスクリプトへのパス
SETUP_SCRIPT := ./scripts/setup.sh
UPDATE_SCRIPT := ./scripts/update.sh

# セットアップスクリプトの実行
setup:
	@bash $(SETUP_SCRIPT)

# アップデートスクリプトの実行
update:
	@bash $(UPDATE_SCRIPT)

# デフォルトターゲットを設定（省略時にsetupが実行されるようにする）
.DEFAULT_GOAL := setup
