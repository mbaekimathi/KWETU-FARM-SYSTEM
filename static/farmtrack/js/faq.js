(function () {
  var items = document.querySelectorAll(".faq-item__head");
  items.forEach(function (btn) {
    btn.addEventListener("click", function () {
      var item = btn.closest(".faq-item");
      var body = item.querySelector(".faq-item__body");
      var wasOpen = item.classList.contains("is-open");
      document.querySelectorAll(".faq-item.is-open").forEach(function (open) {
        if (open !== item) {
          open.classList.remove("is-open");
          var b = open.querySelector(".faq-item__body");
          if (b) b.style.maxHeight = "0px";
          var ob = open.querySelector(".faq-item__head");
          if (ob) ob.setAttribute("aria-expanded", "false");
        }
      });
      if (wasOpen) {
        item.classList.remove("is-open");
        if (body) body.style.maxHeight = "0px";
        btn.setAttribute("aria-expanded", "false");
      } else {
        item.classList.add("is-open");
        if (body) {
          body.style.maxHeight = body.scrollHeight + 24 + "px";
        }
        btn.setAttribute("aria-expanded", "true");
      }
    });
  });
})();
