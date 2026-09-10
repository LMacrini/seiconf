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
    version = "2026.8.0";
    addonId = "{446900e4-71c2-419f-a6a7-df9c091e268b}";
    url = "https://addons.mozilla.org/firefox/downloads/file/4970633/bitwarden_password_manager-2026.8.0.xpi";
    sha256 = "989ee33f19329af1fc155dcebb7f90a517a7259cea4bfbdd660923d25a7d465a";
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
    version = "22.3.0";
    addonId = "{4f391a9e-8717-4ba6-a5b1-488a34931fcb}";
    url = "https://addons.mozilla.org/firefox/downloads/file/4893547/bonjourr_startpage-22.3.0.xpi";
    sha256 = "240dc1385a1110b288720160cef9cdee7165614d08583323fe0961dda18f74d5";
    meta = with lib; {
      homepage = "https://bonjourr.fr";
      description = "A beautiful and customizable new tab page inspired by iOS, designed for a calm and focused browsing experience.";
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
    version = "4.9.129";
    addonId = "addon@darkreader.org";
    url = "https://addons.mozilla.org/firefox/downloads/file/4899461/darkreader-4.9.129.xpi";
    sha256 = "f4f047fe08e420b6d29617738ea00a7b784892b2262b7e6f38dd09b8ee958a44";
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
    version = "2.3.10";
    addonId = "deArrow@ajay.app";
    url = "https://addons.mozilla.org/firefox/downloads/file/4897568/dearrow-2.3.10.xpi";
    sha256 = "3151a51db8093746be646c041af3ead553e5de95fa4ebd5fae033e039e1056d1";
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
    version = "3.0.2";
    addonId = "jid1-BoFifL9Vbdl2zQ@jetpack";
    url = "https://addons.mozilla.org/firefox/downloads/file/4943310/decentraleyes-3.0.2.xpi";
    sha256 = "e749d0d1985b579332b36aa00d43bd11c9e820b1375701657cf9aceedbb47581";
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
    version = "4.0.0";
    addonId = "{cb31ec5d-c49a-4e5a-b240-16c767444f62}";
    url = "https://addons.mozilla.org/firefox/downloads/file/4982796/indie_wiki_buddy-4.0.0.xpi";
    sha256 = "2769ffe55ff3462eef9029f00d90bb2df7d3f2fa6521b90de47aa81152e25df8";
    meta = with lib; {
      homepage = "https://getindie.wiki/";
      description = "Helping you discover quality, independent wikis!\n\nWhen visiting a Fandom wiki, Indie Wiki Buddy redirects or alerts you of independent alternatives. It also filters search engine results. BreezeWiki is also supported, to reduce clutter on Fandom.";
      license = licenses.mit;
      mozPermissions = [
        "alarms"
        "storage"
        "webRequest"
        "notifications"
        "scripting"
        "https://*.fandom.com/*"
        "https://*.fextralife.com/*"
        "https://*.neoseeker.com/*"
        "https://breezewiki.com/*"
        "https://www.google.com/search*"
      ];
      platforms = platforms.all;
    };
  };
  "libredirect" = buildMozillaXpiAddon {
    pname = "libredirect";
    version = "3.4.0";
    addonId = "7esoorv3@alefvanoon.anonaddy.me";
    url = "https://addons.mozilla.org/firefox/downloads/file/4916828/libredirect-3.4.0.xpi";
    sha256 = "c0fa9a5c2302eb734b1b614284371061330cf2e7b3519ee96c53e8be58ae298f";
    meta = with lib; {
      homepage = "https://libredirect.manerakai.com/";
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
    version = "2.6.85";
    addonId = "{b86e4813-687a-43e6-ab65-0bde4ab75758}";
    url = "https://addons.mozilla.org/firefox/downloads/file/4838011/localcdn_fork_of_decentraleyes-2.6.85.xpi";
    sha256 = "628fcad19950ca5a3005e3e9b54de73842cf9bf87a5c3b543452b10c1647fa60";
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
    version = "1.23.2";
    addonId = "nekocaption@gmail.com";
    url = "https://addons.mozilla.org/firefox/downloads/file/4809223/nekocap-1.23.2.xpi";
    sha256 = "2e5e5c2ef0837d0a5278e4d67270fecf0813d32dae81df8653f6b38fcccdfd40";
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
    version = "26.8.8";
    addonId = "{a4c4eda4-fb84-4a84-b4a1-f7c1cbf2a1ad}";
    url = "https://addons.mozilla.org/firefox/downloads/file/4945591/refined_github-26.8.8.xpi";
    sha256 = "cfa6508a75193560a2623220a4e59c6bad7099fed16d65e04c28f0372775e4c6";
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
    version = "6.1.7";
    addonId = "sponsorBlocker@ajay.app";
    url = "https://addons.mozilla.org/firefox/downloads/file/4897574/sponsorblock-6.1.7.xpi";
    sha256 = "0d50e1632c6f15ee15a543e670e1c572974605a5c02622916e08e026803df83f";
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
    version = "2.4.11";
    addonId = "{7a7a4a92-a2a0-41d1-9fd7-1e92480d612d}";
    url = "https://addons.mozilla.org/firefox/downloads/file/4970801/styl_us-2.4.11.xpi";
    sha256 = "a1fb8025132ad77f3f81dcdf6ac6a31798048a95ea65b975d12b335116df0224";
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
    version = "10.2.1.0";
    addonId = "{036a55b4-5e72-4d05-a06c-cba2dfcc134a}";
    url = "https://addons.mozilla.org/firefox/downloads/file/4962745/traduzir_paginas_web-10.2.1.0.xpi";
    sha256 = "67f4b90279426590ccf88f85aef14509948b4e661682d938a93c0bcce94c523b";
    meta = with lib; {
      description = "Translate your page in real time using Google, Bing or Yandex.\nIt is not necessary to open new tabs.";
      license = licenses.mpl20;
      mozPermissions = [
        "<all_urls>"
        "storage"
        "activeTab"
        "contextMenus"
        "webRequest"
      ];
      platforms = platforms.all;
    };
  };
  "ublock-origin" = buildMozillaXpiAddon {
    pname = "ublock-origin";
    version = "1.74.0";
    addonId = "uBlock0@raymondhill.net";
    url = "https://addons.mozilla.org/firefox/downloads/file/4981431/ublock_origin-1.74.0.xpi";
    sha256 = "175756d74468c9ba45863f7fc333d3be670f82d5b066314e915814dd547d1652";
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
    version = "1.6.73";
    addonId = "{7c7f6dea-3957-4bb9-9eec-2ef2b9e5bcec}";
    url = "https://addons.mozilla.org/firefox/downloads/file/4934073/ultimadark-1.6.73.xpi";
    sha256 = "bd96020450777064464cde118fe7cf49795f0eac05186eb576849dd9b9be0b44";
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
    version = "2.48.0";
    addonId = "{aecec67f-0d10-4fa7-b7c7-609a2db280cf}";
    url = "https://addons.mozilla.org/firefox/downloads/file/4963965/violentmonkey-2.48.0.xpi";
    sha256 = "e73e3103697cbeee3335020c31c7e3c587946929740cd78f9bff1b50bf62be34";
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
    version = "2026.8.13";
    addonId = "{d867162c-4c38-4c5f-aca4-db6a6592d7da}";
    url = "https://addons.mozilla.org/firefox/downloads/file/4955980/youtube_tweaks-2026.8.13.xpi";
    sha256 = "4b90d8b25a3bc6e2e2d09511280805decc40a0677d24a309ae09f1e7c0f2aaae";
    meta = with lib; {
      homepage = "https://github.com/pedrosouu/yt-tweaks";
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
