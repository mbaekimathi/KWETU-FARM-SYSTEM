(function () {
  "use strict";
  var r = window.matchMedia("(prefers-reduced-motion: reduce)").matches;
  var bar = document.querySelector(".sp-scroll");
  var ticking = false;
  function tick() {
    if (bar) {
      var d = document.documentElement;
      var t = d.scrollTop / (d.scrollHeight - d.clientHeight) || 0;
      bar.style.transform = "scaleX(" + (isFinite(t) ? t : 0) + ")";
    }
    if (!r) {
      document.querySelectorAll("[data-parallax]").forEach(function (el) {
        var w = el.closest("[data-parallax-wrap]") || el.parentElement;
        if (!w) return;
        var sp = parseFloat(String(el.getAttribute("data-parallax") || "0.3"), 10);
        if (isNaN(sp)) sp = 0.3;
        var top = w.getBoundingClientRect().top;
        var y = el.hasAttribute("data-parallax-hero")
          ? top * 0.15 * sp
          : (0.5 - (top + w.offsetHeight) / (window.innerHeight + w.offsetHeight)) * 80 * sp;
        el.style.transform = "translate3d(0, " + y.toFixed(1) + "px, 0)";
      });
    }
    ticking = false;
  }
  function req() {
    if (!ticking) {
      requestAnimationFrame(tick);
      ticking = true;
    }
  }
  window.addEventListener("scroll", req, { passive: true });
  window.addEventListener("resize", req, { passive: true });
  req();
})();
