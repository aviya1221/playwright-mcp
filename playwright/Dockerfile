# מבוסס על אימג' הרשמי של Playwright עם כל התלויות של דפדפנים
FROM mcr.microsoft.com/playwright:v1.48.0-jammy

# עבוד בתיקייה אפליקטיבית
WORKDIR /app

# התקן את השרת MCP (ללא קאשינג כבד; אפשר גם npm i -g אם מעדיף)
RUN npm config set fund false \
 && npm config set audit false

# התקנת דפדפנים (בבייס אימג' זה כבר מותקן, אבל נשאיר לשקט נפשי)
RUN npx playwright install --with-deps

# פורט שהאפליקציה תאזין עליו בענן
ENV PORT=8080

# הפקודה שמריצה את שרת ה-MCP
# --host 0.0.0.0 הכרחי בענן; השארת /mcp היא הנקודה ל-Connector
CMD ["npx", "@playwright/mcp@latest", "--host", "0.0.0.0", "--port", "8080"]

EXPOSE 8080
