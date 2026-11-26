// UI strings for testQuotas.html.
// Language: ?lang=xx (passed by the 4D demo) or the browser language.
const LANG = (new URLSearchParams(window.location.search).get('lang') || navigator.language || 'en')
  .slice(0, 2).toLowerCase();

const I18N = {
  ja: {
    'Rate Limiting Demo - 4D Web Server': '流量制限デモ - 4D Web サーバー',
    'Current Values': '現在の値',
    'Refresh': '更新',
    'Number of sessions:': 'セッション数：',
    'Number of Guest sessions:': 'ゲストセッション数：',
    'Number of entity sets:': 'エンティティセット数：',
    'Send a request': 'リクエストを送信',
    'Send a request to the server': 'サーバーにリクエストを 1 件送信します',
    'Send request': 'リクエストを送信',
    'Send Data (Single Request)': 'データ送信（単発リクエスト）',
    'Generate': '生成サイズ：',
    'bytes of data': 'バイト',
    'Create a new session for this request': 'このリクエストで新しいセッションを作成',
    'Create a new session for each request': 'リクエストごとに新しいセッションを作成',
    'Send this data to the web server': 'このデータを Web サーバーに送信',
    'The total includes the HTTP request overhead': '合計には HTTP リクエストのオーバーヘッドが含まれます',
    'Information': '情報',
    '1000 bytes corresponds to 1809 bytes sent in total': '1000 バイトのデータは、合計 1809 バイトの送信に相当します',
    'Request Data (Single Request)': 'データ要求（単発リクエスト）',
    'Request': '要求サイズ：',
    'Request Data': 'データを要求',
    'Send Data (Request Burst)': 'データ送信（連続リクエスト）',
    'Send data every': '送信間隔：',
    'Request data every': '要求間隔：',
    'seconds': '秒',
    'until reaching': '上限：',
    'requests': 'リクエスト',
    'Size to send:': '送信サイズ：',
    'Size to request:': '要求サイズ：',
    'bytes': 'バイト',
    'Start burst': '連続送信を開始',
    'Stop burst': '連続送信を停止',
    'Request Data (Request Burst)': 'データ要求（連続リクエスト）',
    'Start GET Burst': '連続 GET を開始',
    'Stop GET Burst': '連続 GET を停止',
    'Concurrent Sessions': '同時セッション',
    'Number of Guest sessions to open': '開くゲストセッション数',
    'Number of authenticated sessions to open': '開く認証済みセッション数',
    'Open': '開く',
    'Entity sets': 'エンティティセット',
    'Create': '作成',
    'entity sets on a new session': '個のエンティティセット（新しいセッション）',
    'Results': '結果',
    'Number of requests sent:': '送信したリクエスト数：',
    'HTTP status 200 / 2xx:': 'HTTP ステータス 200 / 2xx：',
    'HTTP status 429:': 'HTTP ステータス 429：',
    'Clear Log': 'ログを消去',
    'Note the Retry-After response header indicating when the next time window starts.':
      'Retry-After レスポンスヘッダーで、次の時間枠が始まるタイミングを確認できます。',
    // dynamic strings (testQuotas.js)
    'Request {i} / {count}': 'リクエスト {i} / {count}',
    'Burst completed': '連続送信が完了しました',
    'Burst stopped': '連続送信を停止しました',
    'Done': '完了',
    'Unable to load the number of sessions: {message}': 'セッション数を取得できません：{message}',
    'Unable to create entity sets: {message}': 'エンティティセットを作成できません：{message}',
  },
};

// Translate a source string, replacing {name} placeholders.
function t(text, vars = {}) {
  const dict = I18N[LANG] || {};
  const out = Object.prototype.hasOwnProperty.call(dict, text) ? dict[text] : text;
  return out.replace(/\{(\w+)\}/g, (m, k) => (k in vars ? vars[k] : m));
}

function translatePage() {
  if (!I18N[LANG]) return;
  document.documentElement.lang = LANG;
  document.title = t(document.title);
  const walker = document.createTreeWalker(document.body, NodeFilter.SHOW_TEXT);
  for (let node = walker.nextNode(); node; node = walker.nextNode()) {
    const key = node.nodeValue.replace(/\s+/g, ' ').trim();
    if (key && I18N[LANG][key] !== undefined) {
      const lead = node.nodeValue.match(/^\s*/)[0] ? ' ' : '';
      const trail = node.nodeValue.match(/\s*$/)[0] ? ' ' : '';
      node.nodeValue = lead + I18N[LANG][key] + trail;
    }
  }
  document.querySelectorAll('[title], [aria-label]').forEach((el) => {
    ['title', 'aria-label'].forEach((a) => {
      if (el.hasAttribute(a)) el.setAttribute(a, t(el.getAttribute(a)));
    });
  });
}

translatePage();
