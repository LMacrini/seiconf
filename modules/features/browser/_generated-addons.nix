{
  buildMozillaXpiAddon,
  fetchurl,
  lib,
  stdenv,
}:
{
  "annotations-restored" = buildMozillaXpiAddon {
    pname = "annotations-restored";
    version = "1.2";
    addonId = "{0731d555-4732-4047-99f9-38a388ffa044}";
    url = "https://addons.mozilla.org/firefox/downloads/file/4002251/annotations_restored-1.2.xpi";
    sha256 = "114666c34865b32f31162e47959da3b46735f31c9166ce71fd60a97f04822c64";
    meta = with lib; {
      homepage = "https://github.com/isaackd/AnnotationsRestored";
      description = "Brings annotation support back to YouTube™!";
      license = licenses.gpl3;
      mozPermissions = [
        "https://storage.googleapis.com/biggest_bucket/annotations/*"
        "storage"
        "*://www.youtube.com/*"
      ];
      platforms = platforms.all;
    };
  };
  "bitwarden-password-manager" = buildMozillaXpiAddon {
    pname = "bitwarden-password-manager";
    version = "2026.3.0";
    addonId = "{446900e4-71c2-419f-a6a7-df9c091e268b}";
    url = "https://addons.mozilla.org/firefox/downloads/file/4749958/bitwarden_password_manager-2026.3.0.xpi";
    sha256 = "2dc6d074d4dc0abd2a8966f5065a55e7252bbf5e54b23c31dbedabfac0d4dbc4";
    meta = with lib; {
      homepage = "https://bitwarden.com";
      description = "At home, at work, or on the go, Bitwarden easily secures all your passwords, passkeys, and sensitive information.";
      license = licenses.gpl3;
      mozPermissions = [
        "<all_urls>"
        "*://*/*"
        "alarms"
        "clipboardRead"
        "clipboardWrite"
        "contextMenus"
        "idle"
        "storage"
        "tabs"
        "unlimitedStorage"
        "webNavigation"
        "webRequest"
        "webRequestBlocking"
        "notifications"
        "file:///*"
      ];
      platforms = platforms.all;
    };
  };
  "bonjourr-startpage" = buildMozillaXpiAddon {
    pname = "bonjourr-startpage";
    version = "22.0.0";
    addonId = "{4f391a9e-8717-4ba6-a5b1-488a34931fcb}";
    url = "https://addons.mozilla.org/firefox/downloads/file/4649474/bonjourr_startpage-22.0.0.xpi";
    sha256 = "59d41cf35dce5f873b6682c5a73117a7b4c73395d764f8ab0243d9136f58e999";
    meta = with lib; {
      homepage = "https://bonjourr.fr";
      description = "Improve your web browsing experience with Bonjourr, a beautiful, customizable and lightweight homepage inspired by iOS.";
      license = licenses.gpl3;
      mozPermissions = [ "storage" ];
      platforms = platforms.all;
    };
  };
  "canvasblocker" = buildMozillaXpiAddon {
    pname = "canvasblocker";
    version = "1.12";
    addonId = "CanvasBlocker@kkapsner.de";
    url = "https://addons.mozilla.org/firefox/downloads/file/4691016/canvasblocker-1.12.xpi";
    sha256 = "0698d92c4bd2d190b2f4025613bf4bd3dba40910d58ab4cf1b32f36637a244c9";
    meta = with lib; {
      homepage = "https://github.com/kkapsner/CanvasBlocker/";
      description = "Alters some JS APIs to prevent fingerprinting.";
      license = licenses.mpl20;
      mozPermissions = [
        "<all_urls>"
        "storage"
        "tabs"
        "webRequest"
        "webRequestBlocking"
        "contextualIdentities"
        "cookies"
        "privacy"
      ];
      platforms = platforms.all;
    };
  };
  "catppuccin-macchiato-pink" = buildMozillaXpiAddon {
    pname = "catppuccin-macchiato-pink";
    version = "1.1";
    addonId = "{f6a92958-4dd7-4f80-bda3-936d3af8e63f}";
    url = "https://addons.mozilla.org/firefox/downloads/file/4509411/catppuccin_macchiato_pink-1.1.xpi";
    sha256 = "69a535a11ca73b2b232a669171ff84abc032169eafd2b8a4f9bd54a6eee007b9";
    meta = with lib; {
      homepage = "https://github.com/catppuccin/firefox";
      description = "🦊 Soothing pastel theme for Firefox";
      mozPermissions = [ ];
      platforms = platforms.all;
    };
  };
  "consent-o-matic" = buildMozillaXpiAddon {
    pname = "consent-o-matic";
    version = "1.1.5";
    addonId = "gdpr@cavi.au.dk";
    url = "https://addons.mozilla.org/firefox/downloads/file/4515369/consent_o_matic-1.1.5.xpi";
    sha256 = "a2119abc329638d6e7af1ab4e5548a348465e02eec11de08dee0af84919923dc";
    meta = with lib; {
      homepage = "https://consentomatic.au.dk/";
      description = "Automatic handling of GDPR consent forms";
      license = licenses.mit;
      mozPermissions = [
        "activeTab"
        "tabs"
        "storage"
        "<all_urls>"
      ];
      platforms = platforms.all;
    };
  };
  "darkreader" = buildMozillaXpiAddon {
    pname = "darkreader";
    version = "4.9.124";
    addonId = "addon@darkreader.org";
    url = "https://addons.mozilla.org/firefox/downloads/file/4748915/darkreader-4.9.124.xpi";
    sha256 = "ce703c98545999cee0b5c416f4fd4a3080f1405440f005d5c5cf23ac0868bcbd";
    meta = with lib; {
      homepage = "https://darkreader.org/";
      description = "Dark mode for every website. Take care of your eyes, use dark theme for night and daily browsing.";
      license = licenses.mit;
      mozPermissions = [
        "alarms"
        "contextMenus"
        "storage"
        "tabs"
        "theme"
        "<all_urls>"
      ];
      platforms = platforms.all;
    };
  };
  "dearrow" = buildMozillaXpiAddon {
    pname = "dearrow";
    version = "2.3.5";
    addonId = "deArrow@ajay.app";
    url = "https://addons.mozilla.org/firefox/downloads/file/4760405/dearrow-2.3.5.xpi";
    sha256 = "4d83666ae933ce9b9a7061742e7776dcc98bfbbbe47e60d0a5b99271fc9f6085";
    meta = with lib; {
      homepage = "https://dearrow.ajay.app";
      description = "Crowdsourcing titles and thumbnails to be descriptive and not sensational";
      license = licenses.lgpl3;
      mozPermissions = [
        "storage"
        "unlimitedStorage"
        "alarms"
        "https://sponsor.ajay.app/*"
        "https://dearrow-thumb.ajay.app/*"
        "https://*.googlevideo.com/*"
        "https://*.youtube.com/*"
        "https://www.youtube-nocookie.com/embed/*"
        "scripting"
        "https://dearrow.ajay.app/*"
      ];
      platforms = platforms.all;
    };
  };
  "decentraleyes" = buildMozillaXpiAddon {
    pname = "decentraleyes";
    version = "3.0.0";
    addonId = "jid1-BoFifL9Vbdl2zQ@jetpack";
    url = "https://addons.mozilla.org/firefox/downloads/file/4392113/decentraleyes-3.0.0.xpi";
    sha256 = "6f2efed90696ac7f8ca7efb8ab308feb3bdf182350b3acfdf4050c09cc02f113";
    meta = with lib; {
      homepage = "https://decentraleyes.org";
      description = "Protects you against tracking through \"free\", centralized, content delivery. It prevents a lot of requests from reaching networks like Google Hosted Libraries, and serves local files to keep sites from breaking. Complements regular content blockers.";
      license = licenses.mpl20;
      mozPermissions = [
        "privacy"
        "webNavigation"
        "webRequestBlocking"
        "webRequest"
        "unlimitedStorage"
        "storage"
        "tabs"
      ];
      platforms = platforms.all;
    };
  };
  "firefox-color" = buildMozillaXpiAddon {
    pname = "firefox-color";
    version = "2.1.7";
    addonId = "FirefoxColor@mozilla.com";
    url = "https://addons.mozilla.org/firefox/downloads/file/3643624/firefox_color-2.1.7.xpi";
    sha256 = "b7fb07b6788f7233dd6223e780e189b4c7b956c25c40493c28d7020493249292";
    meta = with lib; {
      homepage = "https://color.firefox.com";
      description = "Build, save and share beautiful Firefox themes.";
      license = licenses.mpl20;
      mozPermissions = [
        "theme"
        "storage"
        "tabs"
        "https://color.firefox.com/*"
      ];
      platforms = platforms.all;
    };
  };
  "indie-wiki-buddy" = buildMozillaXpiAddon {
    pname = "indie-wiki-buddy";
    version = "3.14.4";
    addonId = "{cb31ec5d-c49a-4e5a-b240-16c767444f62}";
    url = "https://addons.mozilla.org/firefox/downloads/file/4773275/indie_wiki_buddy-3.14.4.xpi";
    sha256 = "4bab840aef056b3e4c5d14aaeb99507fb1e58601d8da8c845a6b89738f49836d";
    meta = with lib; {
      homepage = "https://getindie.wiki/";
      description = "Helping you discover quality, independent wikis!\n\nWhen visiting a Fandom wiki, Indie Wiki Buddy redirects or alerts you of independent alternatives. It also filters search engine results. BreezeWiki is also supported, to reduce clutter on Fandom.";
      license = licenses.mit;
      mozPermissions = [
        "storage"
        "webRequest"
        "notifications"
        "scripting"
        "https://*.fandom.com/*"
        "https://*.fextralife.com/*"
        "https://*.neoseeker.com/*"
        "https://breezewiki.com/*"
        "https://antifandom.com/*"
        "https://bw.artemislena.eu/*"
        "https://breezewiki.catsarch.com/*"
        "https://breezewiki.esmailelbob.xyz/*"
        "https://breezewiki.frontendfriendly.xyz/*"
        "https://bw.hamstro.dev/*"
        "https://breeze.hostux.net/*"
        "https://breezewiki.hyperreal.coffee/*"
        "https://breeze.mint.lgbt/*"
        "https://breezewiki.nadeko.net/*"
        "https://nerd.whatever.social/*"
        "https://breeze.nohost.network/*"
        "https://z.opnxng.com/*"
        "https://bw.projectsegfau.lt/*"
        "https://breezewiki.pussthecat.org/*"
        "https://bw.vern.cc/*"
        "https://breeze.whateveritworks.org/*"
        "https://breezewiki.woodland.cafe/*"
        "https://*.bing.com/search*"
        "https://search.brave.com/search*"
        "https://*.duckduckgo.com/*"
        "https://*.ecosia.org/*"
        "https://kagi.com/search*"
        "https://*.qwant.com/*"
        "https://*.search.yahoo.com/*"
        "https://*.startpage.com/*"
        "https://*.ya.ru/*"
        "https://*.yandex.az/*"
        "https://*.yandex.by/*"
        "https://*.yandex.co.il/*"
        "https://*.yandex.com.am/*"
        "https://*.yandex.com.ge/*"
        "https://*.yandex.com.tr/*"
        "https://*.yandex.com/*"
        "https://*.yandex.ee/*"
        "https://*.yandex.eu/*"
        "https://*.yandex.fr/*"
        "https://*.yandex.kz/*"
        "https://*.yandex.lt/*"
        "https://*.yandex.lv/*"
        "https://*.yandex.md/*"
        "https://*.yandex.ru/*"
        "https://*.yandex.tj/*"
        "https://*.yandex.tm/*"
        "https://*.yandex.uz/*"
        "https://www.google.com/search*"
        "https://www.google.ad/search*"
        "https://www.google.ae/search*"
        "https://www.google.com.af/search*"
        "https://www.google.com.ag/search*"
        "https://www.google.com.ai/search*"
        "https://www.google.al/search*"
        "https://www.google.am/search*"
        "https://www.google.co.ao/search*"
        "https://www.google.com.ar/search*"
        "https://www.google.as/search*"
        "https://www.google.at/search*"
        "https://www.google.com.au/search*"
        "https://www.google.az/search*"
        "https://www.google.ba/search*"
        "https://www.google.com.bd/search*"
        "https://www.google.be/search*"
        "https://www.google.bf/search*"
        "https://www.google.bg/search*"
        "https://www.google.com.bh/search*"
        "https://www.google.bi/search*"
        "https://www.google.bj/search*"
        "https://www.google.com.bn/search*"
        "https://www.google.com.bo/search*"
        "https://www.google.com.br/search*"
        "https://www.google.bs/search*"
        "https://www.google.bt/search*"
        "https://www.google.co.bw/search*"
        "https://www.google.by/search*"
        "https://www.google.com.bz/search*"
        "https://www.google.ca/search*"
        "https://www.google.cd/search*"
        "https://www.google.cf/search*"
        "https://www.google.cg/search*"
        "https://www.google.ch/search*"
        "https://www.google.ci/search*"
        "https://www.google.co.ck/search*"
        "https://www.google.cl/search*"
        "https://www.google.cm/search*"
        "https://www.google.cn/search*"
        "https://www.google.com.co/search*"
        "https://www.google.co.cr/search*"
        "https://www.google.com.cu/search*"
        "https://www.google.cv/search*"
        "https://www.google.com.cy/search*"
        "https://www.google.cz/search*"
        "https://www.google.de/search*"
        "https://www.google.dj/search*"
        "https://www.google.dk/search*"
        "https://www.google.dm/search*"
        "https://www.google.com.do/search*"
        "https://www.google.dz/search*"
        "https://www.google.com.ec/search*"
        "https://www.google.ee/search*"
        "https://www.google.com.eg/search*"
        "https://www.google.es/search*"
        "https://www.google.com.et/search*"
        "https://www.google.fi/search*"
        "https://www.google.com.fj/search*"
        "https://www.google.fm/search*"
        "https://www.google.fr/search*"
        "https://www.google.ga/search*"
        "https://www.google.ge/search*"
        "https://www.google.gg/search*"
        "https://www.google.com.gh/search*"
        "https://www.google.com.gi/search*"
        "https://www.google.gl/search*"
        "https://www.google.gm/search*"
        "https://www.google.gr/search*"
        "https://www.google.com.gt/search*"
        "https://www.google.gy/search*"
        "https://www.google.com.hk/search*"
        "https://www.google.hn/search*"
        "https://www.google.hr/search*"
        "https://www.google.ht/search*"
        "https://www.google.hu/search*"
        "https://www.google.co.id/search*"
        "https://www.google.ie/search*"
        "https://www.google.co.il/search*"
        "https://www.google.im/search*"
        "https://www.google.co.in/search*"
        "https://www.google.iq/search*"
        "https://www.google.is/search*"
        "https://www.google.it/search*"
        "https://www.google.je/search*"
        "https://www.google.com.jm/search*"
        "https://www.google.jo/search*"
        "https://www.google.co.jp/search*"
        "https://www.google.co.ke/search*"
        "https://www.google.com.kh/search*"
        "https://www.google.ki/search*"
        "https://www.google.kg/search*"
        "https://www.google.co.kr/search*"
        "https://www.google.com.kw/search*"
        "https://www.google.kz/search*"
        "https://www.google.la/search*"
        "https://www.google.com.lb/search*"
        "https://www.google.li/search*"
        "https://www.google.lk/search*"
        "https://www.google.co.ls/search*"
        "https://www.google.lt/search*"
        "https://www.google.lu/search*"
        "https://www.google.lv/search*"
        "https://www.google.com.ly/search*"
        "https://www.google.co.ma/search*"
        "https://www.google.md/search*"
        "https://www.google.me/search*"
        "https://www.google.mg/search*"
        "https://www.google.mk/search*"
        "https://www.google.ml/search*"
        "https://www.google.com.mm/search*"
        "https://www.google.mn/search*"
        "https://www.google.ms/search*"
        "https://www.google.com.mt/search*"
        "https://www.google.mu/search*"
        "https://www.google.mv/search*"
        "https://www.google.mw/search*"
        "https://www.google.com.mx/search*"
        "https://www.google.com.my/search*"
        "https://www.google.co.mz/search*"
        "https://www.google.com.na/search*"
        "https://www.google.com.ng/search*"
        "https://www.google.com.ni/search*"
        "https://www.google.ne/search*"
        "https://www.google.nl/search*"
        "https://www.google.no/search*"
        "https://www.google.com.np/search*"
        "https://www.google.nr/search*"
        "https://www.google.nu/search*"
        "https://www.google.co.nz/search*"
        "https://www.google.com.om/search*"
        "https://www.google.com.pa/search*"
        "https://www.google.com.pe/search*"
        "https://www.google.com.pg/search*"
        "https://www.google.com.ph/search*"
        "https://www.google.com.pk/search*"
        "https://www.google.pl/search*"
        "https://www.google.pn/search*"
        "https://www.google.com.pr/search*"
        "https://www.google.ps/search*"
        "https://www.google.pt/search*"
        "https://www.google.com.py/search*"
        "https://www.google.com.qa/search*"
        "https://www.google.ro/search*"
        "https://www.google.ru/search*"
        "https://www.google.rw/search*"
        "https://www.google.com.sa/search*"
        "https://www.google.com.sb/search*"
        "https://www.google.sc/search*"
        "https://www.google.se/search*"
        "https://www.google.com.sg/search*"
        "https://www.google.sh/search*"
        "https://www.google.si/search*"
        "https://www.google.sk/search*"
        "https://www.google.com.sl/search*"
        "https://www.google.sn/search*"
        "https://www.google.so/search*"
        "https://www.google.sm/search*"
        "https://www.google.sr/search*"
        "https://www.google.st/search*"
        "https://www.google.com.sv/search*"
        "https://www.google.td/search*"
        "https://www.google.tg/search*"
        "https://www.google.co.th/search*"
        "https://www.google.com.tj/search*"
        "https://www.google.tl/search*"
        "https://www.google.tm/search*"
        "https://www.google.tn/search*"
        "https://www.google.to/search*"
        "https://www.google.com.tr/search*"
        "https://www.google.tt/search*"
        "https://www.google.com.tw/search*"
        "https://www.google.co.tz/search*"
        "https://www.google.com.ua/search*"
        "https://www.google.co.ug/search*"
        "https://www.google.co.uk/search*"
        "https://www.google.com.uy/search*"
        "https://www.google.co.uz/search*"
        "https://www.google.com.vc/search*"
        "https://www.google.co.ve/search*"
        "https://www.google.vg/search*"
        "https://www.google.co.vi/search*"
        "https://www.google.com.vn/search*"
        "https://www.google.vu/search*"
        "https://www.google.ws/search*"
        "https://www.google.rs/search*"
        "https://www.google.co.za/search*"
        "https://www.google.co.zm/search*"
        "https://www.google.co.zw/search*"
        "https://www.google.cat/search*"
      ];
      platforms = platforms.all;
    };
  };
  "libredirect" = buildMozillaXpiAddon {
    pname = "libredirect";
    version = "3.3.0";
    addonId = "7esoorv3@alefvanoon.anonaddy.me";
    url = "https://addons.mozilla.org/firefox/downloads/file/4734268/libredirect-3.3.0.xpi";
    sha256 = "1c91739ae52c6eb8522f0efb38397c3d5e85d961b3999f3c5d60f89db447877d";
    meta = with lib; {
      homepage = "https://libredirect.github.io";
      description = "Redirects YouTube, Twitter, TikTok... requests to alternative privacy friendly frontends.";
      license = licenses.gpl3;
      mozPermissions = [
        "webRequest"
        "webRequestBlocking"
        "storage"
        "clipboardWrite"
        "contextMenus"
        "<all_urls>"
      ];
      platforms = platforms.all;
    };
  };
  "localcdn-fork-of-decentraleyes" = buildMozillaXpiAddon {
    pname = "localcdn-fork-of-decentraleyes";
    version = "2.6.84";
    addonId = "{b86e4813-687a-43e6-ab65-0bde4ab75758}";
    url = "https://addons.mozilla.org/firefox/downloads/file/4709745/localcdn_fork_of_decentraleyes-2.6.84.xpi";
    sha256 = "ec52022d8bf0e78e873d2cd554889cdab14fe45d22781a8181e4c461227d6665";
    meta = with lib; {
      homepage = "https://www.localcdn.org";
      description = "Emulates remote frameworks (e.g. jQuery, Bootstrap, AngularJS) and delivers them as local resource. Prevents unnecessary 3rd party requests to Google, StackPath, MaxCDN and more. Prepared rules for uBlock Origin/uMatrix.";
      license = licenses.mpl20;
      mozPermissions = [
        "*://*/*"
        "privacy"
        "storage"
        "webNavigation"
        "webRequest"
        "webRequestBlocking"
      ];
      platforms = platforms.all;
    };
  };
  "nekocap" = buildMozillaXpiAddon {
    pname = "nekocap";
    version = "1.22.0";
    addonId = "nekocaption@gmail.com";
    url = "https://addons.mozilla.org/firefox/downloads/file/4719765/nekocap-1.22.0.xpi";
    sha256 = "b30a89e1eed12f9e915ebfbba2208bebbd88b8bbc0df4ad06c9072323fa39ff9";
    meta = with lib; {
      homepage = "https://nekocap.com";
      description = "Create and upload community captions for YouTube videos (and more) with this easy to use extension that supports SSA/ASS rendering.";
      license = licenses.gpl3;
      mozPermissions = [
        "storage"
        "webNavigation"
        "identity"
        "https://*.youtube.com/*"
        "https://*.tver.jp/*"
        "https://*.nicovideo.jp/*"
        "https://*.vimeo.com/*"
        "https://*.bilibili.com/*"
        "https://*.netflix.com/*"
        "https://*.primevideo.com/*"
        "https://*.twitter.com/*"
        "https://*.x.com/*"
        "https://*.wetv.vip/*"
        "https://*.tiktok.com/*"
        "https://*.iq.com/*"
        "https://*.abema.tv/*"
        "https://*.dailymotion.com/*"
        "https://*.bilibili.tv/*"
        "https://*.nogidoga.com/*"
        "https://*.cu.tbs.co.jp/*"
        "https://*.instagram.com/*"
        "https://*.unext.jp/*"
        "https://*.lemino.docomo.ne.jp/*"
        "https://*.oned.net/*"
        "https://*.archive.org/*"
      ];
      platforms = platforms.all;
    };
  };
  "refined-github-" = buildMozillaXpiAddon {
    pname = "refined-github-";
    version = "26.4.20";
    addonId = "{a4c4eda4-fb84-4a84-b4a1-f7c1cbf2a1ad}";
    url = "https://addons.mozilla.org/firefox/downloads/file/4772939/refined_github-26.4.20.xpi";
    sha256 = "d160e48b3d8dc4a6b46c774088d67fe557116dcd51dd6fa376c02eb0c51deb8a";
    meta = with lib; {
      homepage = "https://github.com/refined-github/refined-github";
      description = "Simplifies the GitHub interface and adds many useful features.";
      license = licenses.mit;
      mozPermissions = [
        "storage"
        "scripting"
        "contextMenus"
        "activeTab"
        "alarms"
        "https://github.com/*"
        "https://gist.github.com/*"
      ];
      platforms = platforms.all;
    };
  };
  "return-youtube-dislikes" = buildMozillaXpiAddon {
    pname = "return-youtube-dislikes";
    version = "3.0.0.18";
    addonId = "{762f9885-5a13-4abd-9c77-433dcd38b8fd}";
    url = "https://addons.mozilla.org/firefox/downloads/file/4371820/return_youtube_dislikes-3.0.0.18.xpi";
    sha256 = "2d33977ce93276537543161f8e05c3612f71556840ae1eb98239284b8f8ba19e";
    meta = with lib; {
      description = "Returns ability to see dislike statistics on youtube";
      license = licenses.gpl3;
      mozPermissions = [
        "activeTab"
        "*://*.youtube.com/*"
        "storage"
        "*://returnyoutubedislikeapi.com/*"
      ];
      platforms = platforms.all;
    };
  };
  "simple-tab-groups" = buildMozillaXpiAddon {
    pname = "simple-tab-groups";
    version = "5.3.2";
    addonId = "simple-tab-groups@drive4ik";
    url = "https://addons.mozilla.org/firefox/downloads/file/4469818/simple_tab_groups-5.3.2.xpi";
    sha256 = "efebf6a9f73a1747044624ddbad7a78fd90ffccdb34a426cf6bb555eda307c49";
    meta = with lib; {
      homepage = "https://github.com/drive4ik/simple-tab-groups";
      description = "Create, modify, and quickly change tab groups";
      license = licenses.mpl20;
      mozPermissions = [
        "tabs"
        "tabHide"
        "notifications"
        "menus"
        "contextualIdentities"
        "cookies"
        "sessions"
        "downloads"
        "management"
        "webRequest"
        "webRequestBlocking"
        "<all_urls>"
        "storage"
        "unlimitedStorage"
      ];
      platforms = platforms.all;
    };
  };
  "sponsorblock" = buildMozillaXpiAddon {
    pname = "sponsorblock";
    version = "6.1.5";
    addonId = "sponsorBlocker@ajay.app";
    url = "https://addons.mozilla.org/firefox/downloads/file/4773757/sponsorblock-6.1.5.xpi";
    sha256 = "d8ec229aecb0b78e307a86d436496891b755f874c24c0f7324551c7ffd1b2e14";
    meta = with lib; {
      homepage = "https://sponsor.ajay.app";
      description = "Easily skip YouTube video sponsors. When you visit a YouTube video, the extension will check the database for reported sponsors and automatically skip known sponsors. You can also report sponsors in videos. Other browsers: https://sponsor.ajay.app";
      license = licenses.lgpl3;
      mozPermissions = [
        "storage"
        "scripting"
        "unlimitedStorage"
        "https://sponsor.ajay.app/*"
        "https://*.youtube.com/*"
        "https://www.youtube-nocookie.com/embed/*"
      ];
      platforms = platforms.all;
    };
  };
  "stop-malware-content" = buildMozillaXpiAddon {
    pname = "stop-malware-content";
    version = "1.4.5";
    addonId = "{f58788c2-383d-4453-9e7d-afdcca0c9e65}";
    url = "https://addons.mozilla.org/firefox/downloads/file/4516688/stop_malware_content-1.4.5.xpi";
    sha256 = "05c6ebcb5f04bfa5e91b49fd131d79b6ed977616532c5d90802228d46a40b86a";
    meta = with lib; {
      homepage = "https://stopmalwarecontent.lodine.xyz";
      description = "Alerts you when you attempt to visit suspicious or harmful websites.";
      license = licenses.gpl3;
      mozPermissions = [ "tabs" ];
      platforms = platforms.all;
    };
  };
  "styl-us" = buildMozillaXpiAddon {
    pname = "styl-us";
    version = "2.3.19";
    addonId = "{7a7a4a92-a2a0-41d1-9fd7-1e92480d612d}";
    url = "https://addons.mozilla.org/firefox/downloads/file/4661054/styl_us-2.3.19_qtD9vir.xpi";
    sha256 = "fed97d9b8cb8793d1b1f95c95abfaf7660377c0ba71d49ec48ffd3d676f66af1";
    meta = with lib; {
      homepage = "https://add0n.com/stylus.html";
      description = "Redesign your favorite websites with Stylus, an actively developed and community driven userstyles manager. Easily install custom themes from popular online repositories, or create, edit, and manage your own personalized CSS stylesheets.";
      license = licenses.gpl3;
      mozPermissions = [
        "alarms"
        "contextMenus"
        "storage"
        "tabs"
        "unlimitedStorage"
        "webNavigation"
        "webRequest"
        "webRequestBlocking"
        "<all_urls>"
        "https://userstyles.org/*"
      ];
      platforms = platforms.all;
    };
  };
  "traduzir-paginas-web" = buildMozillaXpiAddon {
    pname = "traduzir-paginas-web";
    version = "10.1.1.1";
    addonId = "{036a55b4-5e72-4d05-a06c-cba2dfcc134a}";
    url = "https://addons.mozilla.org/firefox/downloads/file/4455681/traduzir_paginas_web-10.1.1.1.xpi";
    sha256 = "dc94a7efac63468f7d34a74bedf5c8b360a67c99d213bb5b1a1d55d911797782";
    meta = with lib; {
      description = "Translate your page in real time using Google, Bing or Yandex.\nIt is not necessary to open new tabs.";
      license = licenses.mpl20;
      mozPermissions = [
        "<all_urls>"
        "storage"
        "activeTab"
        "contextMenus"
        "webRequest"
        "https://www.deepl.com/*/translator*"
      ];
      platforms = platforms.all;
    };
  };
  "ublock-origin" = buildMozillaXpiAddon {
    pname = "ublock-origin";
    version = "1.70.0";
    addonId = "uBlock0@raymondhill.net";
    url = "https://addons.mozilla.org/firefox/downloads/file/4721638/ublock_origin-1.70.0.xpi";
    sha256 = "f2730d2877005763a45d765749892e936f49cae713d28f7aa6ea314454b89cf1";
    meta = with lib; {
      homepage = "https://github.com/gorhill/uBlock#ublock-origin";
      description = "Finally, an efficient wide-spectrum content blocker. Easy on CPU and memory.";
      license = licenses.gpl3;
      mozPermissions = [
        "alarms"
        "dns"
        "menus"
        "privacy"
        "storage"
        "tabs"
        "unlimitedStorage"
        "webNavigation"
        "webRequest"
        "webRequestBlocking"
        "<all_urls>"
        "http://*/*"
        "https://*/*"
        "file://*/*"
        "https://easylist.to/*"
        "https://*.fanboy.co.nz/*"
        "https://filterlists.com/*"
        "https://forums.lanik.us/*"
        "https://github.com/*"
        "https://*.github.io/*"
        "https://github.com/uBlockOrigin/*"
        "https://ublockorigin.github.io/*"
        "https://*.reddit.com/r/uBlockOrigin/*"
      ];
      platforms = platforms.all;
    };
  };
  "ultimadark" = buildMozillaXpiAddon {
    pname = "ultimadark";
    version = "1.6.66";
    addonId = "{7c7f6dea-3957-4bb9-9eec-2ef2b9e5bcec}";
    url = "https://addons.mozilla.org/firefox/downloads/file/4735965/ultimadark-1.6.66.xpi";
    sha256 = "ff69639f43eed5f60c29441d34d51b26801b66b827b4bb4068eaf7380794df61";
    meta = with lib; {
      homepage = "https://github.com/ThomazPom/Moz-Ext-UltimaDark";
      description = "UltimaDark uses agressive and smart techniques to turn even the sunniest websites into realms of darkness.\nAlthough it works well, this is so experimental, it makes lab rats look like seasoned professionals. \nGo ahead, embrace the shadows! 🦇";
      license = licenses.mpl20;
      mozPermissions = [
        "<all_urls>"
        "tabs"
        "browsingData"
        "webNavigation"
        "webRequest"
        "webRequestBlocking"
        "storage"
        "unlimitedStorage"
      ];
      platforms = platforms.all;
    };
  };
  "vimium-ff" = buildMozillaXpiAddon {
    pname = "vimium-ff";
    version = "2.4.2";
    addonId = "{d7742d87-e61d-4b78-b8a1-b469842139fa}";
    url = "https://addons.mozilla.org/firefox/downloads/file/4717567/vimium_ff-2.4.2.xpi";
    sha256 = "131e2a67580e7ae9125ab19781159e61409fac47b441fc2782aab76396ead196";
    meta = with lib; {
      homepage = "https://github.com/philc/vimium";
      description = "The Hacker's Browser. Vimium provides keyboard shortcuts for navigation and control in the spirit of Vim.";
      license = licenses.mit;
      mozPermissions = [
        "tabs"
        "bookmarks"
        "history"
        "storage"
        "sessions"
        "notifications"
        "scripting"
        "webNavigation"
        "search"
        "clipboardRead"
        "clipboardWrite"
        "<all_urls>"
        "file:///"
        "file:///*/"
      ];
      platforms = platforms.all;
    };
  };
  "violentmonkey" = buildMozillaXpiAddon {
    pname = "violentmonkey";
    version = "2.37.0";
    addonId = "{aecec67f-0d10-4fa7-b7c7-609a2db280cf}";
    url = "https://addons.mozilla.org/firefox/downloads/file/4777100/violentmonkey-2.37.0.xpi";
    sha256 = "5d04b402f391c3a3b826aed064bf771de41c94cbc8ccd8f7b3a3ce70cb01d735";
    meta = with lib; {
      homepage = "https://violentmonkey.github.io/";
      description = "Userscript support for browsers, open source.";
      license = licenses.mit;
      mozPermissions = [
        "tabs"
        "<all_urls>"
        "webRequest"
        "webRequestBlocking"
        "notifications"
        "storage"
        "unlimitedStorage"
        "clipboardWrite"
        "contextMenus"
        "cookies"
      ];
      platforms = platforms.all;
    };
  };
  "youtube-anti-translate" = buildMozillaXpiAddon {
    pname = "youtube-anti-translate";
    version = "1.19.12";
    addonId = "{458160b9-32eb-4f4c-87d1-89ad3bdeb9dc}";
    url = "https://addons.mozilla.org/firefox/downloads/file/4572770/youtube_anti_translate-1.19.12.xpi";
    sha256 = "640195b5f8b26697491b2704d30c125446309a0ef8c0c1198d9c6b3a370a260f";
    meta = with lib; {
      description = "A small extension to disable YT video titles autotranslation.";
      license = licenses.mpl20;
      mozPermissions = [
        "storage"
        "*://*.youtube.com/*"
        "*://m.youtube.com/*"
      ];
      platforms = platforms.all;
    };
  };
  "youtube-nonstop" = buildMozillaXpiAddon {
    pname = "youtube-nonstop";
    version = "0.9.2";
    addonId = "{0d7cafdd-501c-49ca-8ebb-e3341caaa55e}";
    url = "https://addons.mozilla.org/firefox/downloads/file/4187690/youtube_nonstop-0.9.2.xpi";
    sha256 = "7659d180f76ea908ea81b84ed9bdd188624eaaa62b88accbe6d8ad4e8caeff38";
    meta = with lib; {
      homepage = "https://github.com/lawfx/YoutubeNonStop";
      description = "Tired of getting that \"Video paused. Continue watching?\" confirmation dialog?\nThis extension autoclicks it, so you can listen to your favorite music uninterrupted.\n\nWorking on YouTube and YouTube Music!";
      license = licenses.mit;
      mozPermissions = [
        "https://www.youtube.com/*"
        "https://music.youtube.com/*"
      ];
      platforms = platforms.all;
    };
  };
  "youtube-tweaks" = buildMozillaXpiAddon {
    pname = "youtube-tweaks";
    version = "2026.4.13";
    addonId = "{d867162c-4c38-4c5f-aca4-db6a6592d7da}";
    url = "https://addons.mozilla.org/firefox/downloads/file/4763741/youtube_tweaks-2026.4.13.xpi";
    sha256 = "881ae700188e787d2a4899f9d56fca6518f57c506fa847d0b4c5de3ae1e0ba5d";
    meta = with lib; {
      description = "A collection of tweaks for hiding Shorts, disabling auto-dubbing, disabling 'Video paused. Continue watching?', changing the number of videos per row and more!";
      license = licenses.mit;
      mozPermissions = [
        "storage"
        "https://www.youtube.com/*"
      ];
      platforms = platforms.all;
    };
  };
}
