// Smooth scrolling for navigation links
const navLinks = document.querySelectorAll('nav ul li a');

function setActiveNav(targetLink) {
    navLinks.forEach(link => link.classList.toggle('active', link === targetLink));
}

const defaultNavLink = document.querySelector('nav ul li a[href="#hero"]');
if (defaultNavLink) {
    setActiveNav(defaultNavLink);
}

navLinks.forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault();
        const target = document.querySelector(this.getAttribute('href'));
        if (target) {
            target.scrollIntoView({
                behavior: 'smooth',
                block: 'start'
            });
            setActiveNav(this);
        }
    });
});

// Intersection Observer for scroll animations
const observerOptions = {
    threshold: 0.15,
    rootMargin: '0px 0px -100px 0px'
};

const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            entry.target.classList.add('animate');
            if (entry.target.id) {
                const activeLink = document.querySelector(`nav ul li a[href="#${entry.target.id}"]`);
                if (activeLink) setActiveNav(activeLink);
            }
        }
    });
}, observerOptions);

document.querySelectorAll('section').forEach(section => observer.observe(section));

// Button press and ripple effects
const buttons = document.querySelectorAll('.btn');

buttons.forEach(btn => {
    btn.addEventListener('mousedown', () => {
        btn.classList.add('pressed');
    });
    btn.addEventListener('mouseup', () => {
        btn.classList.remove('pressed');
    });
    btn.addEventListener('mouseleave', () => {
        btn.classList.remove('pressed');
    });
    btn.addEventListener('click', function (e) {
        const ripple = document.createElement('span');
        ripple.className = 'ripple';
        const rect = btn.getBoundingClientRect();
        const size = Math.max(rect.width, rect.height);
        ripple.style.width = ripple.style.height = `${size}px`;
        ripple.style.left = `${e.clientX - rect.left - size / 2}px`;
        ripple.style.top = `${e.clientY - rect.top - size / 2}px`;
        btn.appendChild(ripple);
        setTimeout(() => ripple.remove(), 600);
    });
});

// Parallax effect for hero background
window.addEventListener('scroll', () => {
    const scrolled = window.pageYOffset;
    const hero = document.querySelector('.hero');
    if (hero) {
        hero.style.backgroundPositionY = -(scrolled * 0.4) + 'px';
    }
});

// Mobile menu toggle (future)
const nav = document.querySelector('nav ul');
const menuToggle = document.createElement('button');
menuToggle.textContent = '☰';
menuToggle.className = 'menu-toggle';

document.querySelector('nav').appendChild(menuToggle);

menuToggle.addEventListener('click', () => {
    nav.classList.toggle('open');
});

if (window.innerWidth <= 768) {
    menuToggle.style.display = 'block';
}
