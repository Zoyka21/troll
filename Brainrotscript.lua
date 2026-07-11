<!DOCTYPE html>
<html lang="ru">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
  <title>Brainrot Stealer PRO+</title>
  <style>
    /* ----- Общие стили (мобильный-first) ----- */
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
      user-select: none;
      -webkit-tap-highlight-color: transparent;
    }

    body {
      min-height: 100vh;
      background: #0b0b1a;
      display: flex;
      justify-content: center;
      align-items: center;
      overflow: hidden;
      touch-action: manipulation;
    }

    #particles-canvas {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      z-index: 0;
      pointer-events: none;
    }

    .app-wrapper {
      position: relative;
      z-index: 1;
      width: 100%;
      height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    /* ----- Плавающая кнопка ----- */
    .floating-btn {
      position: fixed;
      bottom: 24px;
      right: 24px;
      width: 68px;
      height: 68px;
      border-radius: 50%;
      background: rgba(20, 10, 40, 0.75);
      backdrop-filter: blur(8px);
      -webkit-backdrop-filter: blur(8px);
      border: 2px solid #ff2d95;
      box-shadow: 0 0 30px #ff2d95, 0 0 70px #ff2d9580, inset 0 0 20px #ff2d95;
      color: #fff;
      font-size: 34px;
      cursor: pointer;
      transition: 0.25s ease;
      display: flex;
      align-items: center;
      justify-content: center;
      z-index: 999;
      animation: pulse-glow 2s infinite alternate;
      touch-action: manipulation;
    }
    .floating-btn:active { transform: scale(0.88); }
    @keyframes pulse-glow {
      0% { box-shadow: 0 0 20px #ff2d95, 0 0 50px #ff2d9566, inset 0 0 10px #ff2d95; }
      100% { box-shadow: 0 0 45px #ff2d95, 0 0 90px #ff2d95aa, inset 0 0 25px #ff2d95; }
    }

    /* ----- Неоновое меню (на всю ширину) ----- */
    .menu-panel {
      position: fixed;
      top: 0;
      right: -110vw;
      width: 100vw;
      max-width: 100vw;
      height: 100vh;
      background: rgba(8, 6, 20, 0.94);
      backdrop-filter: blur(16px);
      -webkit-backdrop-filter: blur(16px);
      border-left: 2px solid #00f0ff;
      box-shadow: -5px 0 50px rgba(0, 240, 255, 0.25);
      transition: right 0.4s cubic-bezier(0.22, 1, 0.36, 1);
      z-index: 1000;
      padding: 20px 16px 30px;
      overflow-y: auto;
      color: #e0e0ff;
      display: flex;
      flex-direction: column;
      touch-action: pan-y;
    }
    .menu-panel.open { right: 0; }
    .menu-panel::-webkit-scrollbar { width: 4px; }
    .menu-panel::-webkit-scrollbar-thumb { background: #00f0ff; border-radius: 10px; box-shadow: 0 0 15px #00f0ff; }

    .menu-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 18px;
      border-bottom: 1px solid rgba(0, 240, 255, 0.25);
      padding-bottom: 12px;
      flex-shrink: 0;
    }
    .menu-header h2 {
      font-size: 26px;
      font-weight: 700;
      background: linear-gradient(135deg, #ff2d95, #ffaa00, #00f0ff);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      text-shadow: 0 0 30px rgba(255, 45, 149, 0.3);
      letter-spacing: 0.5px;
    }
    .menu-close {
      background: none;
      border: none;
      color: #ff2d95;
      font-size: 32px;
      cursor: pointer;
      transition: 0.2s;
      text-shadow: 0 0 20px #ff2d95;
      padding: 0 8px;
    }
    .menu-close:active { transform: rotate(90deg); }

    .counter-box {
      text-align: center;
      margin: 6px 0 18px;
      padding: 14px 10px;
      background: rgba(0, 240, 255, 0.04);
      border-radius: 20px;
      border: 1px solid rgba(0, 240, 255, 0.15);
      box-shadow: 0 0 30px rgba(0, 240, 255, 0.06);
      flex-shrink: 0;
    }
    .counter-box .label {
      font-size: 12px;
      text-transform: uppercase;
      letter-spacing: 2px;
      color: #00f0ff;
      text-shadow: 0 0 20px #00f0ff66;
    }
    .counter-box .count {
      font-size: 48px;
      font-weight: 800;
      background: linear-gradient(135deg, #ff2d95, #ffaa00);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      text-shadow: 0 0 40px #ff2d9588;
      line-height: 1.2;
    }
    .counter-box .sub {
      font-size: 14px;
      color: #aab;
      margin-top: 2px;
    }
    .counter-box .sub span { color: #00f0ff; text-shadow: 0 0 12px #00f0ff66; }

    .steal-btn {
      width: 100%;
      padding: 16px 0;
      margin: 6px 0 18px;
      background: rgba(255, 45, 149, 0.15);
      border: 2px solid #ff2d95;
      border-radius: 60px;
      color: #fff;
      font-size: 22px;
      font-weight: 700;
      letter-spacing: 2px;
      text-transform: uppercase;
      cursor: pointer;
      transition: 0.15s;
      box-shadow: 0 0 30px #ff2d9566, inset 0 0 15px #ff2d9544;
      text-shadow: 0 0 20px #ff2d95;
      flex-shrink: 0;
      touch-action: manipulation;
    }
    .steal-btn:active { transform: scale(0.94); background: rgba(255, 45, 149, 0.3); }

    .upgrades-section {
      flex: 1;
      margin: 4px 0 8px;
      min-height: 140px;
    }
    .upgrades-section h3 {
      font-size: 16px;
      font-weight: 400;
      letter-spacing: 2px;
      color: #00f0ff;
      text-shadow: 0 0 20px #00f0ff55;
      margin-bottom: 12px;
      border-left: 3px solid #00f0ff;
      padding-left: 12px;
    }

    .upgrade-item {
      background: rgba(0, 240, 255, 0.04);
      border: 1px solid rgba(0, 240, 255, 0.12);
      border-radius: 14px;
      padding: 12px 14px;
      margin-bottom: 10px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      transition: 0.15s;
    }
    .upgrade-item:active { background: rgba(0, 240, 255, 0.1); }
    .upgrade-info {
      display: flex;
      flex-direction: column;
      flex: 1;
      min-width: 0;
    }
    .upgrade-name { font-weight: 600; font-size: 16px; color: #f0f0ff; }
    .upgrade-desc { font-size: 12px; color: #99a; margin-top: 1px; }
    .upgrade-price {
      color: #ffaa00;
      font-weight: 600;
      font-size: 14px;
      text-shadow: 0 0 15px #ffaa0066;
      white-space: nowrap;
      margin-right: 8px;
    }
    .upgrade-buy {
      background: rgba(255, 170, 0, 0.12);
      border: 1px solid #ffaa00;
      border-radius: 40px;
      color: #fff;
      padding: 5px 14px;
      font-size: 15px;
      font-weight: 600;
      cursor: pointer;
      transition: 0.15s;
      box-shadow: 0 0 20px #ffaa0033;
      text-shadow: 0 0 10px #ffaa00;
      touch-action: manipulation;
      white-space: nowrap;
    }
    .upgrade-buy:active { transform: scale(0.92); background: rgba(255, 170, 0, 0.25); }
    .upgrade-buy:disabled {
      opacity: 0.35;
      cursor: not-allowed;
      filter: grayscale(0.6);
      transform: none !important;
      box-shadow: none !important;
    }

    /* ----- Блоки способностей (ноклип, невидимость, неуязвимость) ----- */
    .abilities-section {
      margin-top: 8px;
      padding: 12px 14px;
      background: rgba(0, 255, 200, 0.04);
      border: 1px solid rgba(0, 255, 200, 0.2);
      border-radius: 16px;
      flex-shrink: 0;
    }
    .abilities-section .title {
      font-weight: 600;
      font-size: 15px;
      color: #7fffd4;
      text-shadow: 0 0 20px #00ffaa55;
      margin-bottom: 10px;
      letter-spacing: 1px;
    }
    .ability-row {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 8px;
      padding: 4px 0;
    }
    .ability-row:last-child { margin-bottom: 0; }
    .ability-info {
      display: flex;
      flex-direction: column;
    }
    .ability-name {
      font-weight: 600;
      font-size: 15px;
      color: #e0f0ff;
    }
    .ability-status {
      font-size: 12px;
      color: #88aacc;
    }
    .ability-status .active { color: #00ff88; text-shadow: 0 0 15px #00ff8866; }
    .ability-status .inactive { color: #ff6b6b; text-shadow: 0 0 15px #ff6b6b44; }
    .ability-btn {
      background: rgba(0, 255, 200, 0.1);
      border: 1px solid #00ffaa;
      border-radius: 40px;
      color: #fff;
      padding: 4px 16px;
      font-size: 14px;
      font-weight: 600;
      cursor: pointer;
      transition: 0.15s;
      text-shadow: 0 0 12px #00ffaa66;
      box-shadow: 0 0 20px #00ffaa22;
      touch-action: manipulation;
      white-space: nowrap;
    }
    .ability-btn:active { transform: scale(0.92); }
    .ability-btn:disabled {
      opacity: 0.4;
      cursor: not-allowed;
      transform: none !important;
    }
    .ability-btn.active-btn {
      background: rgba(0, 255, 200, 0.25);
      border-color: #ff2d95;
      box-shadow: 0 0 30px #ff2d9566;
    }

    /* ----- Авто-закрытие базы ----- */
    .auto-close-section {
      margin-top: 10px;
      padding: 12px 14px;
      background: rgba(255, 0, 100, 0.06);
      border: 1px solid rgba(255, 0, 100, 0.25);
      border-radius: 16px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      flex-shrink: 0;
    }
    .auto-close-section .info {
      display: flex;
      flex-direction: column;
    }
    .auto-close-section .info .title {
      font-weight: 600;
      font-size: 16px;
      color: #ff6b9d;
      text-shadow: 0 0 20px #ff2d9566;
    }
    .auto-close-section .info .desc {
      font-size: 12px;
      color: #aab;
    }
    .auto-close-btn {
      background: rgba(255, 0, 100, 0.15);
      border: 1px solid #ff2d95;
      border-radius: 40px;
      color: #fff;
      padding: 6px 18px;
      font-size: 15px;
      font-weight: 600;
      cursor: pointer;
      transition: 0.15s;
      text-shadow: 0 0 12px #ff2d95;
      box-shadow: 0 0 20px #ff2d9533;
      touch-action: manipulation;
      white-space: nowrap;
    }
    .auto-close-btn:active { transform: scale(0.92); }
    .auto-close-btn:disabled {
      opacity: 0.4;
      cursor: not-allowed;
      transform: none !important;
    }

    .menu-footer {
      margin-top: 16px;
      text-align: center;
      font-size: 12px;
      color: #556;
      border-top: 1px solid rgba(0, 240, 255, 0.08);
      padding-top: 12px;
      letter-spacing: 1px;
      flex-shrink: 0;
    }
    .menu-footer span { color: #ff2d95; text-shadow: 0 0 15px #ff2d9566; }

    @media (max-width: 400px) {
      .menu-panel { padding: 16px 12px 20px; }
      .counter-box .count { font-size: 40px; }
      .steal-btn { font-size: 19px; padding: 14px 0; }
      .upgrade-item { padding: 10px 12px; }
      .floating-btn { width: 60px; height: 60px; font-size: 28px; bottom: 18px; right: 18px; }
    }
  </style>
</head>
<body>

  <canvas id="particles-canvas"></canvas>

  <button class="floating-btn" id="floatingToggle" aria-label="Открыть меню">🧠</button>

  <div class="menu-panel" id="menuPanel">
    <div class="menu-header">
      <h2>🧠 STEAL PRO+</h2>
      <button class="menu-close" id="menuCloseBtn">✕</button>
    </div>

    <div class="counter-box">
      <div class="label">Brainrot добыто</div>
      <div class="count" id="brainrotCount">0</div>
      <div class="sub">⚡ <span id="perSecondDisplay">0</span> /сек &nbsp;|&nbsp; 💪 <span id="clickPowerDisplay">1</span></div>
    </div>

    <button class="steal-btn" id="stealBtn">УКРАСТЬ</button>

    <div class="upgrades-section">
      <h3>⟡ УЛУЧШЕНИЯ</h3>
      <div id="upgradesContainer"></div>
    </div>

    <!-- НОВЫЙ БЛОК: Способности (ноклип, невидимость, неуязвимость) -->
    <div class="abilities-section" id="abilitiesSection">
      <div class="title">🌀 СПОСОБНОСТИ</div>
      <div class="ability-row">
        <div class="ability-info">
          <span class="ability-name">🕳️ Ноклип</span>
          <span class="ability-status" id="noclipStatus">⚪ выкл</span>
        </div>
        <button class="ability-btn" id="noclipBtn">Включить</button>
      </div>
      <div class="ability-row">
        <div class="ability-info">
          <span class="ability-name">👻 Невидимость</span>
          <span class="ability-status" id="invisibilityStatus">⚪ выкл</span>
        </div>
        <button class="ability-btn" id="invisibilityBtn">Включить</button>
      </div>
      <div class="ability-row">
        <div class="ability-info">
          <span class="ability-name">🛡️ Неуязвимость</span>
          <span class="ability-status" id="invincibilityStatus">⚪ выкл</span>
        </div>
        <button class="ability-btn" id="invincibilityBtn">Включить</button>
      </div>
    </div>

    <!-- Авто-закрытие базы -->
    <div class="auto-close-section" id="autoCloseSection">
      <div class="info">
        <div class="title">🔐 Авто-закрытие базы</div>
        <div class="desc">Сбрасывает brainrot до 0, даёт бонус x2 на 30 сек</div>
      </div>
      <button class="auto-close-btn" id="autoCloseBtn">Активировать</button>
    </div>

    <div class="menu-footer">
      <span>⚡</span> неоновая кража <span>⚡</span>
    </div>
  </div>

  <script>
    (function() {
      'use strict';

      // ----- Игровое состояние -----
      const state = {
        brainrot: 0,
        clickPower: 1,
        autoPower: 0,
        multiplier: 1,
        upgrades: [
          { id: 'click', name: 'Острые пальцы', desc: '+1 к силе', basePrice: 10, price: 10, level: 0, maxLevel: 35 },
          { id: 'auto', name: 'Ночной вор', desc: '+1 brainrot/сек', basePrice: 45, price: 45, level: 0, maxLevel: 30 },
          { id: 'multi', name: 'Мозговой вирус', desc: 'x2 доход (макс. 6)', basePrice: 120, price: 120, level: 0, maxLevel: 6 }
        ],
        // Способности
        noclip: false,
        invisibility: false,
        invincibility: false,
        // Авто-закрытие
        autoCloseActive: false,
        autoCloseTimer: null,
        autoCloseMultiplier: 1,
        autoCloseCooldown: false,
        lastTick: performance.now()
      };

      // ----- DOM -----
      const countEl = document.getElementById('brainrotCount');
      const perSecEl = document.getElementById('perSecondDisplay');
      const clickPowerEl = document.getElementById('clickPowerDisplay');
      const stealBtn = document.getElementById('stealBtn');
      const upgradesContainer = document.getElementById('upgradesContainer');
      const menuPanel = document.getElementById('menuPanel');
      const floatingBtn = document.getElementById('floatingToggle');
      const menuCloseBtn = document.getElementById('menuCloseBtn');
      const autoCloseBtn = document.getElementById('autoCloseBtn');

      // Способности DOM
      const noclipBtn = document.getElementById('noclipBtn');
      const invisibilityBtn = document.getElementById('invisibilityBtn');
      const invincibilityBtn = document.getElementById('invincibilityBtn');
      const noclipStatus = document.getElementById('noclipStatus');
      const invisibilityStatus = document.getElementById('invisibilityStatus');
      const invincibilityStatus = document.getElementById('invincibilityStatus');

      // ----- Вспомогательные -----
      function updatePerSecond() {
        const total = state.autoPower * state.multiplier * state.autoCloseMultiplier;
        perSecEl.textContent = total.toFixed(1);
        clickPowerEl.textContent = Math.floor(state.clickPower * state.multiplier * state.autoCloseMultiplier);
      }

      function updateCounter() {
        countEl.textContent = Math.floor(state.brainrot);
        updatePerSecond();
      }

      // ----- Обновление UI улучшений -----
      function updateUpgradesUI() {
        upgradesContainer.innerHTML = '';
        state.upgrades.forEach((upgrade, index) => {
          const item = document.createElement('div');
          item.className = 'upgrade-item';

          const info = document.createElement('div');
          info.className = 'upgrade-info';
          const nameSpan = document.createElement('span');
          nameSpan.className = 'upgrade-name';
          nameSpan.textContent = upgrade.name;
          const descSpan = document.createElement('span');
          descSpan.className = 'upgrade-desc';
          descSpan.textContent = `${upgrade.desc} (ур. ${upgrade.level}/${upgrade.maxLevel})`;
          info.appendChild(nameSpan);
          info.appendChild(descSpan);

          const priceSpan = document.createElement('span');
          priceSpan.className = 'upgrade-price';
          priceSpan.textContent = `💰 ${upgrade.price}`;

          const buyBtn = document.createElement('button');
          buyBtn.className = 'upgrade-buy';
          buyBtn.textContent = 'Купить';
          buyBtn.dataset.index = index;

          const canBuy = state.brainrot >= upgrade.price && upgrade.level < upgrade.maxLevel;
          buyBtn.disabled = !canBuy;

          buyBtn.addEventListener('click', (e) => {
            e.stopPropagation();
            purchaseUpgrade(index);
          });

          const rightSide = document.createElement('div');
          rightSide.style.display = 'flex';
          rightSide.style.alignItems = 'center';
          rightSide.style.gap = '8px';
          rightSide.appendChild(priceSpan);
          rightSide.appendChild(buyBtn);

          item.appendChild(info);
          item.appendChild(rightSide);
          upgradesContainer.appendChild(item);
        });

        updateAutoCloseUI();
        updateAbilitiesUI();
        updateCounter();
      }

      // ----- Покупка улучшения -----
      function purchaseUpgrade(index) {
        const upgrade = state.upgrades[index];
        if (!upgrade) return;
        if (state.brainrot < upgrade.price) return;
        if (upgrade.level >= upgrade.maxLevel) return;

        state.brainrot -= upgrade.price;
        upgrade.level += 1;

        if (upgrade.id === 'click') {
          state.clickPower += 1;
        } else if (upgrade.id === 'auto') {
          state.autoPower += 1;
        } else if (upgrade.id === 'multi') {
          state.multiplier = Math.pow(2, upgrade.level);
        }

        upgrade.price = Math.floor(upgrade.basePrice * Math.pow(1.5, upgrade.level));
        updateUpgradesUI();
        saveGame();
      }

      // ----- Кража -----
      function steal() {
        const gain = state.clickPower * state.multiplier * state.autoCloseMultiplier;
        state.brainrot += gain;
        updateCounter();
        updateUpgradesUI();
        saveGame();
        stealBtn.style.transform = 'scale(0.90)';
        setTimeout(() => { stealBtn.style.transform = ''; }, 100);
      }

      // ----- Авто-тик -----
      function autoTick(timestamp) {
        const delta = Math.min((timestamp - state.lastTick) / 1000, 0.1);
        state.lastTick = timestamp;
        if (state.autoPower > 0 && delta > 0) {
          const gain = state.autoPower * state.multiplier * state.autoCloseMultiplier * delta;
          state.brainrot += gain;
          updateCounter();
        }
        if (Math.floor(timestamp / 600) !== Math.floor((timestamp - 100) / 600)) {
          updateUpgradesUI();
        }
        requestAnimationFrame(autoTick);
      }

      // ========== НОВЫЕ СПОСОБНОСТИ ==========
      function toggleNoclip() {
        state.noclip = !state.noclip;
        updateAbilitiesUI();
        saveGame();
        // Визуальный фидбек
        if (state.noclip) {
          noclipBtn.textContent = 'Выкл';
          noclipBtn.classList.add('active-btn');
          noclipStatus.innerHTML = '🟢 вкл';
          noclipStatus.className = 'ability-status active';
        } else {
          noclipBtn.textContent = 'Включить';
          noclipBtn.classList.remove('active-btn');
          noclipStatus.innerHTML = '⚪ выкл';
          noclipStatus.className = 'ability-status inactive';
        }
      }

      function toggleInvisibility() {
        state.invisibility = !state.invisibility;
        updateAbilitiesUI();
        saveGame();
        if (state.invisibility) {
          invisibilityBtn.textContent = 'Выкл';
          invisibilityBtn.classList.add('active-btn');
          invisibilityStatus.innerHTML = '🟢 вкл';
          invisibilityStatus.className = 'ability-status active';
        } else {
          invisibilityBtn.textContent = 'Включить';
          invisibilityBtn.classList.remove('active-btn');
          invisibilityStatus.innerHTML = '⚪ выкл';
          invisibilityStatus.className = 'ability-status inactive';
        }
      }

      function toggleInvincibility() {
        state.invincibility = !state.invincibility;
        updateAbilitiesUI();
        saveGame();
        if (state.invincibility) {
          invincibilityBtn.textContent = 'Выкл';
          invincibilityBtn.classList.add('active-btn');
          invincibilityStatus.innerHTML = '🟢 вкл';
          invincibilityStatus.className = 'ability-status active';
        } else {
          invincibilityBtn.textContent = 'Включить';
          invincibilityBtn.classList.remove('active-btn');
          invincibilityStatus.innerHTML = '⚪ выкл';
          invincibilityStatus.className = 'ability-status inactive';
        }
      }

      function updateAbilitiesUI() {
        // Ноклип
        if (state.noclip) {
          noclipBtn.textContent = 'Выкл';
          noclipBtn.classList.add('active-btn');
          noclipStatus.innerHTML = '🟢 вкл';
          noclipStatus.className = 'ability-status active';
        } else {
          noclipBtn.textContent = 'Включить';
          noclipBtn.classList.remove('active-btn');
          noclipStatus.innerHTML = '⚪ выкл';
          noclipStatus.className = 'ability-status inactive';
        }
        // Невидимость
        if (state.invisibility) {
          invisibilityBtn.textContent = 'Выкл';
          invisibilityBtn.classList.add('active-btn');
          invisibilityStatus.innerHTML = '🟢 вкл';
          invisibilityStatus.className = 'ability-status active';
        } else {
          invisibilityBtn.textContent = 'Включить';
          invisibilityBtn.classList.remove('active-btn');
          invisibilityStatus.innerHTML = '⚪ выкл';
          invisibilityStatus.className = 'ability-status inactive';
        }
        // Неуязвимость
        if (state.invincibility) {
          invincibilityBtn.textContent = 'Выкл';
          invincibilityBtn.classList.add('active-btn');
          invincibilityStatus.innerHTML = '🟢 вкл';
          invincibilityStatus.className = 'ability-status active';
        } else {
          invincibilityBtn.textContent = 'Включить';
          invincibilityBtn.classList.remove('active-btn');
          invincibilityStatus.innerHTML = '⚪ выкл';
          invincibilityStatus.className = 'ability-status inactive';
        }
      }

      // ===== АВТО-ЗАКРЫТИЕ БАЗЫ =====
      function activateAutoClose() {
        if (state.autoCloseCooldown) return;
        if (state.autoCloseActive) return;

        state.brainrot = 0;
        updateCounter();

        state.autoCloseActive = true;
        state.autoCloseMultiplier = 2;
        state.autoCloseCooldown = true;

        updateAutoCloseUI();
        updateUpgradesUI();
        saveGame();

        if (state.autoCloseTimer) clearTimeout(state.autoCloseTimer);
        state.autoCloseTimer = setTimeout(() => {
          state.autoCloseActive = false;
          state.autoCloseMultiplier = 1;
          state.autoCloseTimer = null;
          setTimeout(() => {
            state.autoCloseCooldown = false;
            updateAutoCloseUI();
            updateUpgradesUI();
          }, 10000);
          updateAutoCloseUI();
          updateUpgradesUI();
          saveGame();
        }, 30000);

        autoCloseBtn.textContent = '⏳ 30 сек';
        autoCloseBtn.disabled = true;
        document.getElementById('autoCloseSection').style.borderColor = '#00ffaa';
      }

      function updateAutoCloseUI() {
        if (state.autoCloseActive) {
          autoCloseBtn.textContent = `⏳ ${Math.ceil((state.autoCloseTimer ? 30 - (Date.now() - state.autoCloseTimer._startTime) / 1000 : 30))} сек`;
          autoCloseBtn.disabled = true;
          document.getElementById('autoCloseSection').style.borderColor = '#00ffaa';
        } else if (state.autoCloseCooldown) {
          autoCloseBtn.textContent = '🔄 перезарядка...';
          autoCloseBtn.disabled = true;
          document.getElementById('autoCloseSection').style.borderColor = 'rgba(255,0,100,0.25)';
        } else {
          autoCloseBtn.textContent = 'Активировать';
          autoCloseBtn.disabled = false;
          document.getElementById('autoCloseSection').style.borderColor = 'rgba(255,0,100,0.25)';
        }
      }

      let timerInterval = null;
      function startTimerUI() {
        if (timerInterval) clearInterval(timerInterval);
        timerInterval = setInterval(() => {
          if (state.autoCloseActive && state.autoCloseTimer) {
            const elapsed = (Date.now() - state.autoCloseTimer._startTime) / 1000;
            const remaining = Math.max(0, 30 - elapsed);
            autoCloseBtn.textContent = `⏳ ${Math.ceil(remaining)} сек`;
          } else if (!state.autoCloseActive && !state.autoCloseCooldown) {
            autoCloseBtn.textContent = 'Активировать';
            autoCloseBtn.disabled = false;
          } else if (state.autoCloseCooldown && !state.autoCloseActive) {
            autoCloseBtn.textContent = '🔄 перезарядка...';
            autoCloseBtn.disabled = true;
          }
          updateAbilitiesUI();
        }, 500);
      }

      const originalSetTimeout = window.setTimeout;
      window.setTimeout = function(fn, delay, ...args) {
        const id = originalSetTimeout(fn, delay, ...args);
        if (id._startTime === undefined) {
          id._startTime = Date.now();
        }
        return id;
      };

      // ----- Сохранение / загрузка -----
      function saveGame() {
        try {
          const data = {
            brainrot: state.brainrot,
            clickPower: state.clickPower,
            autoPower: state.autoPower,
            multiplier: state.multiplier,
            upgrades: state.upgrades.map(u => ({ id: u.id, level: u.level, price: u.price })),
            autoCloseCooldown: state.autoCloseCooldown,
            autoCloseActive: state.autoCloseActive,
            noclip: state.noclip,
            invisibility: state.invisibility,
            invincibility: state.invincibility
          };
          localStorage.setItem('brainrotStealerSave', JSON.stringify(data));
        } catch (e) {}
      }

      function loadGame() {
        try {
          const raw = localStorage.getItem('brainrotStealerSave');
          if (!raw) return;
          const data = JSON.parse(raw);
          state.brainrot = data.brainrot || 0;
          state.clickPower = data.clickPower || 1;
          state.autoPower = data.autoPower || 0;
          state.multiplier = data.multiplier || 1;
          state.autoCloseCooldown = data.autoCloseCooldown || false;
          state.autoCloseActive = data.autoCloseActive || false;
          state.noclip = data.noclip || false;
          state.invisibility = data.invisibility || false;
          state.invincibility = data.invincibility || false;

          if (state.autoCloseActive) state.autoCloseMultiplier = 2;

          if (data.upgrades) {
            data.upgrades.forEach(saved => {
              const found = state.upgrades.find(u => u.id === saved.id);
              if (found) {
                found.level = saved.level || 0;
                found.price = saved.price || found.basePrice;
              }
            });
            const clickUp = state.upgrades.find(u => u.id === 'click');
            if (clickUp) state.clickPower = 1 + clickUp.level;
            const autoUp = state.upgrades.find(u => u.id === 'auto');
            if (autoUp) state.autoPower = autoUp.level;
            const multiUp = state.upgrades.find(u => u.id === 'multi');
            if (multiUp) state.multiplier = Math.pow(2, multiUp.level);
          }
          state.upgrades.forEach(u => {
            u.price = Math.floor(u.basePrice * Math.pow(1.5, u.level));
          });

          if (state.autoCloseActive) {
            state.autoCloseActive = false;
            state.autoCloseMultiplier = 1;
            state.autoCloseCooldown = false;
            saveGame();
          }
        } catch (e) {}
        updateCounter();
        updateUpgradesUI();
        updateAutoCloseUI();
        updateAbilitiesUI();
      }

      // ----- Управление меню -----
      function openMenu() {
        menuPanel.classList.add('open');
        floatingBtn.style.display = 'none';
      }
      function closeMenu() {
        menuPanel.classList.remove('open');
        floatingBtn.style.display = 'flex';
      }

      floatingBtn.addEventListener('click', openMenu);
      menuCloseBtn.addEventListener('click', closeMenu);
      document.addEventListener('click', (e) => {
        if (menuPanel.classList.contains('open')) {
          if (!menuPanel.contains(e.target) && e.target !== floatingBtn) {
            closeMenu();
          }
        }
      });
      document.addEventListener('keydown', (e) => {
        if (e.key === 'Escape' && menuPanel.classList.contains('open')) closeMenu();
      });

      // ----- Частицы -----
      function initParticles() {
        const canvas = document.getElementById('particles-canvas');
        const ctx = canvas.getContext('2d');
        let w, h;
        const particles = [];
        const count = 70;

        function resize() {
          w = canvas.width = window.innerWidth;
          h = canvas.height = window.innerHeight;
        }
        window.addEventListener('resize', resize);
        resize();

        class Particle {
          constructor() { this.reset(); }
          reset() {
            this.x = Math.random() * w;
            this.y = Math.random() * h;
            this.size = Math.random() * 2 + 0.6;
            this.speedX = (Math.random() - 0.5) * 0.4;
            this.speedY = (Math.random() - 0.5) * 0.4;
            this.opacity = Math.random() * 0.5 + 0.2;
            this.color = `hsl(${Math.random() * 60 + 280}, 80%, 70%)`;
          }
          update() {
            this.x += this.speedX;
            this.y += this.speedY;
            if (this.x < 0 || this.x > w || this.y < 0 || this.y > h) this.reset();
          }
          draw() {
            ctx.beginPath();
            ctx.arc(this.x, this.y, this.size, 0, Math.PI * 2);
            ctx.fillStyle = this.color;
            ctx.shadowColor = this.color;
            ctx.shadowBlur = 12;
            ctx.globalAlpha = this.opacity;
            ctx.fill();
            ctx.shadowBlur = 0;
            ctx.globalAlpha = 1;
          }
        }

        for (let i = 0; i < count; i++) particles.push(new Particle());

        function animateParticles() {
          ctx.clearRect(0, 0, w, h);
          particles.forEach(p => { p.update(); p.draw(); });
          for (let i = 0; i < particles.length; i++) {
            for (let j = i + 1; j < particles.length; j++) {
              const dx = particles[i].x - particles[j].x;
              const dy = particles[i].y - particles[j].y;
              const dist = Math.sqrt(dx * dx + dy * dy);
              if (dist < 110) {
                ctx.beginPath();
                ctx.moveTo(particles[i].x, particles[i].y);
                ctx.lineTo(particles[j].x, particles[j].y);
                ctx.strokeStyle = `rgba(180, 130, 255, ${0.1 * (1 - dist / 110)})`;
                ctx.lineWidth = 0.5;
                ctx.stroke();
              }
            }
          }
          requestAnimationFrame(animateParticles);
        }
        animateParticles();
      }
      initParticles();

      // ----- События -----
      stealBtn.addEventListener('click', steal);
      autoCloseBtn.addEventListener('click', activateAutoClose);

      noclipBtn.addEventListener('click', toggleNoclip);
      invisibilityBtn.addEventListener('click', toggleInvisibility);
      invincibilityBtn.addEventListener('click', toggleInvincibility);

      // Запуск
      loadGame();
      state.lastTick = performance.now();
      requestAnimationFrame(autoTick);
      startTimerUI();

      setInterval(() => {
        updateUpgradesUI();
        updateCounter();
      }, 1000);

      console.log('🧠 Brainrot Stealer PRO+ с ноклипом, невидимостью и неуязвимостью!');
    })();
  </script>
</body>
</html>
