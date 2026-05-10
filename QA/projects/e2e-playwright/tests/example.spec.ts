import { test, expect } from '@playwright/test';

test.describe('Search Functionality', () => {
  test('should display search results for valid query', async ({ page }) => {
    await page.goto('https://playwright.dev/');
    
    // Click the search button
    await page.getByRole('button', { name: 'Search' }).click();
    
    // Type the query
    await page.getByPlaceholder('Search docs').fill('locators');
    
    // Verify result appears
    await expect(page.getByRole('link', { name: 'Locators', exact: true })).toBeVisible();
  });

  test('visual comparison', async ({ page }) => {
    await page.goto('https://playwright.dev/');
    await expect(page).toHaveScreenshot();
  });
});
