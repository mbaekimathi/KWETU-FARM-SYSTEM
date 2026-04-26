(function () {
  "use strict";

  var nav = document.querySelector(".nav-site");
  var mobileToggle = document.querySelector(".mobile-nav-toggle");

  function onScroll() {
    if (!nav) return;
    if (window.scrollY > 80) {
      nav.classList.add("scrolled");
    } else {
      nav.classList.remove("scrolled");
    }
    var pbar = document.querySelector(".js-scroll-progress");
    if (pbar) {
      var d = document.documentElement;
      var t = d.scrollTop / (d.scrollHeight - d.clientHeight) || 0;
      pbar.style.transform = "scaleX(" + (isFinite(t) ? t : 0) + ")";
    }
  }
  window.addEventListener("scroll", onScroll, { passive: true });
  onScroll();

  if (mobileToggle && nav) {
    mobileToggle.addEventListener("click", function () {
      nav.classList.toggle("nav-open");
    });
    document.querySelectorAll(".nav-links a").forEach(function (a) {
      a.addEventListener("click", function () {
        nav.classList.remove("nav-open");
      });
    });
  }

  var sections = document.querySelectorAll(".section-block");
  if (sections.length && "IntersectionObserver" in window) {
    var io = new IntersectionObserver(
      function (entries) {
        entries.forEach(function (e) {
          if (e.isIntersecting) {
            e.target.classList.add("visible");
          }
        });
      },
      { rootMargin: "0px 0px -6% 0px", threshold: 0.08 }
    );
    sections.forEach(function (s) {
      io.observe(s);
    });
  } else {
    sections.forEach(function (s) {
      s.classList.add("visible");
    });
  }

  var statNums = document.querySelectorAll(".stat-num[data-target]");
  var counterDone = false;

  function animateCount() {
    if (counterDone) return;
    statNums.forEach(function (el) {
      var target = parseFloat(el.getAttribute("data-target") || "0");
      var suffix = el.getAttribute("data-suffix") || "";
      var prefix = el.getAttribute("data-prefix") || "";
      if (isNaN(target)) return;
      var start = 0;
      var duration = 1200;
      var startTime = null;
      function step(t) {
        if (!startTime) startTime = t;
        var p = Math.min((t - startTime) / duration, 1);
        var ease = 1 - Math.pow(1 - p, 2);
        var val = start + (target - start) * ease;
        if (target % 1 !== 0) {
          el.textContent = prefix + val.toFixed(1) + suffix;
        } else {
          el.textContent = prefix + Math.round(val) + suffix;
        }
        if (p < 1) {
          requestAnimationFrame(step);
        } else {
          if (target % 1 !== 0) {
            el.textContent = prefix + target.toFixed(1) + suffix;
          } else {
            el.textContent = prefix + target + suffix;
          }
        }
      }
      requestAnimationFrame(step);
    });
    counterDone = true;
  }

  var statsEl = document.getElementById("stats");
  if (statsEl && "IntersectionObserver" in window) {
    var statsIo = new IntersectionObserver(
      function (entries) {
        entries.forEach(function (e) {
          if (e.isIntersecting) {
            animateCount();
            statsIo.disconnect();
          }
        });
      },
      { threshold: 0.2 }
    );
    statsIo.observe(statsEl);
  } else {
    animateCount();
  }

  var ctaForm = document.getElementById("cta-form");
  if (ctaForm) {
    ctaForm.addEventListener("submit", function (e) {
      e.preventDefault();
    });
  }
})();
