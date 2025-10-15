# מבוסס על אימג' הרשמי של Playwright עם כל התלויות של דפדפנים
FROM mcr.microsoft.com/playwright:v1.48.0-jammy

# עבוד בתיקייה אפליקטיבית
WORKDIR /app

# מניעת אזהרות npm מיותרות
RUN npm config set fund false && npm config set audit false

# התקנת דפדפנים (לרוב כבר מותקן, אבל נשאיר לשקט נפשי)
RUN npx playwright install --with-deps

# הגדרת פורט ברירת מחדל לענן
ENV PORT=8080

# מריצים את שרת ה-MCP
# --host 0.0.0.0 מאפשר גישה חיצונית
# --allowed-hosts "*" ו---allowed-origins "*" פותחים גישה מכל דומיין
CMD ["npx", "@playwright/mcp@latest",
     "--host", "0.0.0.0",
     "--port", "8080",
     "--allowed-hosts", "*",
     "--allowed-origins", "*"]

# מציינים שפורט 8080 פתוח
EXPOSE 8080
