import { LollaPage } from './app.po';

describe('lolla App', () => {
  let page: LollaPage;

  beforeEach(() => {
    page = new LollaPage();
  });

  it('should display welcome message', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('Welcome to app!');
  });
});
