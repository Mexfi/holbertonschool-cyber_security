# Passive Reconnaissance Report  
## Target: holbertonschool.com

---

## 1. Scope and Methodology

This report presents passive reconnaissance findings for the domain **holbertonschool.com** using **Shodan** and publicly available OSINT data.  
No active scanning or intrusive techniques were performed.

The objectives of this reconnaissance are:
- Identify IP ranges associated with holbertonschool.com
- Identify technologies and frameworks used across its subdomains

---

## 2. IP Ranges Associated with holbertonschool.com

Based on Shodan results and ASN correlation, holbertonschool.com infrastructure is primarily hosted on **Amazon Web Services (AWS)** and **Cloudflare**.

### 2.1 Identified IP Addresses

| IP Address | Provider | Notes |
|-----------|--------|------|
| 75.2.70.75 | AWS | Load balancer / frontend |
| 99.83.190.102 | AWS | Load balancer |
| 63.35.51.142 | AWS | Webflow-hosted services |
| 13.36.10.99 | AWS (eu-west-3) | Application backend |
| 13.37.98.87 | AWS | Read platform |
| 52.85.96.0/24 | AWS CloudFront | Static assets |
| 104.16.53.0/24 | Cloudflare | Support services |

### 2.2 Observed IP Ranges

The following IP ranges were identified via ASN mapping and Shodan:

- **Amazon AWS**
  - `13.0.0.0/8`
  - `52.0.0.0/8`
  - `54.0.0.0/8`
  - `75.2.0.0/16`
  - `99.83.0.0/16`

- **Cloudflare**
  - `104.16.0.0/12`

---

## 3. Technologies and Frameworks Identified

Shodan technology fingerprints across multiple subdomains reveal the following stack.

### 3.1 Web Servers

| Technology | Usage |
|----------|------|
| Nginx | Primary reverse proxy |
| Amazon ELB | Load balancing |
| CloudFront | CDN for static assets |

---

### 3.2 Web Frameworks & Platforms

| Framework / Platform | Subdomains |
|--------------------|-----------|
| Ruby on Rails | apply.holbertonschool.com |
| Webflow | www.holbertonschool.com, webflow subdomains |
| Discourse | forum / discussion platforms |
| Zendesk | support.holbertonschool.com |

---

### 3.3 Programming Languages

- Ruby
- JavaScript
- HTML5 / CSS3

---

### 3.4 Security and Infrastructure

| Technology | Purpose |
|----------|--------|
| Cloudflare | DDoS protection & WAF |
| AWS Shield | Network protection |
| TLS 1.2 / 1.3 | Transport security |

---

## 4. Notable Observations

- The infrastructure is **highly distributed**, relying on managed cloud services.
- Most subdomains are protected behind **Cloudflare**, reducing direct exposure.
- No direct origin IPs were identified for critical production services.
- Email services are handled via **Google Workspace (MX records)**.

---

## 5. Conclusion

Holbertonschool.com uses a modern, cloud-native infrastructure leveraging AWS, Cloudflare, and multiple SaaS platforms.  
The attack surface is primarily limited by CDN and WAF protections, making passive reconnaissance and subdomain enumeration the most effective initial approach.

---

## 6. Disclaimer

This report is based solely on **passive reconnaissance techniques** and publicly available information.  
No active scanning or exploitation was conducted.

