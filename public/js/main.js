(function ($) {
    "use strict";

    // Spinner
    var spinner = function () {
        setTimeout(function () {
            if ($('#spinner').length > 0) {
                $('#spinner').removeClass('show');
            }
        }, 1);
    };
    spinner();


    // Initiate the wowjs
    new WOW().init();


    // Dropdown on mouse hover
    const $dropdown = $(".dropdown");
    const $dropdownToggle = $(".dropdown-toggle");
    const $dropdownMenu = $(".dropdown-menu");
    const showClass = "show";

    $(window).on("load resize", function() {
        if (this.matchMedia("(min-width: 992px)").matches) {
            $dropdown.hover(
            function() {
                const $this = $(this);
                $this.addClass(showClass);
                $this.find($dropdownToggle).attr("aria-expanded", "true");
                $this.find($dropdownMenu).addClass(showClass);
            },
            function() {
                const $this = $(this);
                $this.removeClass(showClass);
                $this.find($dropdownToggle).attr("aria-expanded", "false");
                $this.find($dropdownMenu).removeClass(showClass);
            }
            );
        } else {
            $dropdown.off("mouseenter mouseleave");
        }
    });


    // Back to top button
    $(window).scroll(function () {
        if ($(this).scrollTop() > 300) {
            $('.back-to-top').fadeIn('slow');
        } else {
            $('.back-to-top').fadeOut('slow');
        }
    });
    $('.back-to-top').click(function () {
        $('html, body').animate({scrollTop: 0}, 1500, 'easeInOutExpo');
        return false;
    });


    // Facts counter
    $('[data-toggle="counter-up"]').counterUp({
        delay: 10,
        time: 2000
    });


    // Modal Video
    $(document).ready(function () {
        var $videoSrc;
        $('.btn-play').click(function () {
            $videoSrc = $(this).data("src");
        });
        console.log($videoSrc);

        $('#videoModal').on('shown.bs.modal', function (e) {
            $("#video").attr('src', $videoSrc + "?autoplay=1&amp;modestbranding=1&amp;showinfo=0");
        })

        $('#videoModal').on('hide.bs.modal', function (e) {
            $("#video").attr('src', $videoSrc);
        })
    });


    // Testimonials carousel
    $(".testimonial-carousel").owlCarousel({
        autoplay: true,
        smartSpeed: 1000,
        margin: 25,
        dots: false,
        loop: true,
        nav : true,
        navText : [
            '<i class="bi bi-arrow-left"></i>',
            '<i class="bi bi-arrow-right"></i>'
        ],
        responsive: {
            0:{
                items:1
            },
            768:{
                items:2
            }
        }
    });

    $('#date1').datetimepicker({
        format: 'YYYY-MM-DD'
    });
    $('#date2').datetimepicker({
        format: 'YYYY-MM-DD'
    });

    // ===== MODERN ENHANCEMENTS =====

    // Intersection Observer for Scroll Animations
    const observerOptions = {
        root: null,
        rootMargin: '0px',
        threshold: 0.1
    };

    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('fade-in-up');
                entry.target.style.opacity = '1';
            }
        });
    }, observerOptions);

    // Observe elements for animation
    document.querySelectorAll('.service-item, .room-card, .team-item').forEach(el => {
        el.style.opacity = '0';
        observer.observe(el);
    });

    // Navbar Scroll Effect
    $(window).scroll(function () {
        if ($(this).scrollTop() > 50) {
            $('.navbar').addClass('navbar-scrolled');
        } else {
            $('.navbar').removeClass('navbar-scrolled');
        }
    });

    // Add ripple effect to buttons
    $('.btn').addClass('btn-ripple');

    // Card hover enhancements
    $('.card').addClass('card-hover');

    // Form input focus animations
    $('input, textarea, select').addClass('form-control-focus');

    // Smooth reveal animations on scroll
    function revealOnScroll() {
        var reveals = document.querySelectorAll('.reveal');
        for (var i = 0; i < reveals.length; i++) {
            var windowHeight = window.innerHeight;
            var elementTop = reveals[i].getBoundingClientRect().top;
            var elementVisible = 150;
            if (elementTop < windowHeight - elementVisible) {
                reveals[i].classList.add('active');
            }
        }
    }
    window.addEventListener('scroll', revealOnScroll);

    // Counter Animation with easing
    function animateCounter($element) {
        var target = parseInt($element.attr('data-target'));
        var duration = 2000;
        var start = 0;
        var increment = target / (duration / 16);

        function updateCounter() {
            start += increment;
            if (start < target) {
                $element.text(Math.floor(start));
                requestAnimationFrame(updateCounter);
            } else {
                $element.text(target);
            }
        }
        updateCounter();
    }

    // Trigger counter animation when in viewport
    var counterTriggered = false;
    $(window).scroll(function () {
        var $counterSection = $('.counter-section');
        if ($counterSection.length) {
            var top = $counterSection.offset().top - window.innerHeight;
            if (top < 0 && !counterTriggered) {
                $('.counter').each(function () {
                    animateCounter($(this));
                });
                counterTriggered = true;
            }
        }
    });

    // Image lazy loading
    if ('IntersectionObserver' in window) {
        const imageObserver = new IntersectionObserver((entries, observer) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    const img = entry.target;
                    img.src = img.dataset.src;
                    img.classList.add('loaded');
                    observer.unobserve(img);
                }
            });
        });

        document.querySelectorAll('img[data-src]').forEach(img => {
            imageObserver.observe(img);
        });
    }

    // Toast notification system
    window.showToast = function(message, type = 'success') {
        const toast = $(`
            <div class="toast-enter position-fixed top-0 end-0 p-3" style="z-index: 9999;">
                <div class="toast show" role="alert">
                    <div class="toast-header bg-${type === 'success' ? 'success' : type === 'error' ? 'danger' : 'primary'} text-white">
                        <strong class="me-auto">Notification</strong>
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="toast"></button>
                    </div>
                    <div class="toast-body">${message}</div>
                </div>
            </div>
        `);
        $('body').append(toast);
        setTimeout(() => toast.remove(), 5000);
    };

    // Preloader with minimum display time
    $(window).on('load', function() {
        setTimeout(function() {
            $('#spinner').fadeOut('slow', function() {
                $(this).remove();
            });
        }, 800);
    });

    // Smooth scroll for anchor links
    $('a[href^="#"]').on('click', function(event) {
        var target = $(this.getAttribute('href'));
        if (target.length) {
            event.preventDefault();
            $('html, body').stop().animate({
                scrollTop: target.offset().top - 100
            }, 1000, 'easeInOutExpo');
        }
    });

    // Parallax effect for hero sections
    $(window).scroll(function() {
        var scrolled = $(window).scrollTop();
        $('.parallax-bg').css('transform', 'translateY(' + (scrolled * 0.5) + 'px)');
    });

    // Room card hover 3D effect
    $('.room-card').on('mousemove', function(e) {
        var card = $(this);
        var cardRect = card[0].getBoundingClientRect();
        var x = e.clientX - cardRect.left;
        var y = e.clientY - cardRect.top;
        var centerX = cardRect.width / 2;
        var centerY = cardRect.height / 2;
        var rotateX = (y - centerY) / 20;
        var rotateY = (centerX - x) / 20;

        card.css('transform', `perspective(1000px) rotateX(${rotateX}deg) rotateY(${rotateY}deg) scale3d(1.02, 1.02, 1.02)`);
    }).on('mouseleave', function() {
        $(this).css('transform', 'perspective(1000px) rotateX(0) rotateY(0) scale3d(1, 1, 1)');
    });

    // Booking form validation visual feedback
    $('form').on('submit', function(e) {
        var $form = $(this);
        var isValid = true;

        $form.find('[required]').each(function() {
            if (!$(this).val()) {
                isValid = false;
                $(this).addClass('is-invalid');
                $(this).shake();
            } else {
                $(this).removeClass('is-invalid').addClass('is-valid');
            }
        });

        if (!isValid) {
            e.preventDefault();
            showToast('Please fill in all required fields', 'error');
        }
    });

    // Shake animation for invalid fields
    $.fn.shake = function() {
        this.each(function() {
            var $el = $(this);
            $el.css('animation', 'none');
            setTimeout(function() {
                $el.css('animation', 'shake 0.5s');
            }, 10);
        });
        return this;
    };

    // Add shake keyframes dynamically
    if (!$('#shake-style').length) {
        $('<style id="shake-style">@keyframes shake { 0%, 100% { transform: translateX(0); } 25% { transform: translateX(-10px); } 75% { transform: translateX(10px); } }</style>').appendTo('head');
    }

    // Dynamic year in copyright
    $('.copyright-year').text(new Date().getFullYear());

    // Search input with debounce
    var searchTimeout;
    $('.search-input').on('input', function() {
        clearTimeout(searchTimeout);
        var $input = $(this);
        searchTimeout = setTimeout(function() {
            // Perform search
            console.log('Searching for:', $input.val());
        }, 500);
    });

    // Back to top with progress indicator
    $(window).scroll(function() {
        var scrollPercent = ($(window).scrollTop() / ($(document).height() - $(window).height())) * 100;
        $('.back-to-top').attr('data-progress', Math.round(scrollPercent));

        if ($(this).scrollTop() > 300) {
            $('.back-to-top').fadeIn('slow');
        } else {
            $('.back-to-top').fadeOut('slow');
        }
    });

    // Room availability check AJAX
    window.checkAvailability = function(roomId, checkIn, checkOut) {
        return $.ajax({
            url: '/api/check-availability',
            method: 'POST',
            data: {
                room_id: roomId,
                check_in: checkIn,
                check_out: checkOut,
                _token: $('meta[name="csrf-token"]').attr('content')
            }
        });
    };

    // Price calculator with animation
    window.calculatePrice = function(pricePerNight, nights) {
        var total = pricePerNight * nights;
        var $display = $('.price-display');

        $({value: 0}).animate({value: total}, {
            duration: 1000,
            easing: 'easeOutExpo',
            step: function() {
                $display.text('$' + Math.floor(this.value));
            },
            complete: function() {
                $display.text('$' + total);
            }
        });

        return total;
    };

})(jQuery);

