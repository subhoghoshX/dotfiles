---
allowed-tools: Bash(npm:*), Bash(git:*), Bash(rm src/App.css), Bash(rm public/vite.svg), Bash(rm src/assets/react.svg), Edit, Bash(rm src/index.css), Bash(touch .prettierrc)
---

# Setup a vite project

Run the following commands in order:

- `npm create vite@latest . -- --template react-ts`
- `npm install`
- `git init`
- `git add .`
- `git commit -m 'init'`

Then your next goal is to clean up the default vite boilerplate. Follow the below commands in order:

- `rm src/App.css` and remove the import from `src/App.tsx`
- remove all the content of `src/index.css`, but keep the file (use Edit tool, instead of Overwrite)
- `rm public/vite.svg` and remove the favicon line from `index.html`
- `rm src/assets/react.svg`
- remove everything from `src/App.tsx` and only return the jsx `<h1>Hello world</h1>`
- `git commit -m 'clean up'`

Next, add tailwind css:

- `npm install tailwindcss @tailwindcss/vite`
- then import tailwind css in vite.config.ts with `import tailwindcss from '@tailwindcss/vite'` and then add it to the list of plugins
- add the line `@import "tailwindcss";` in `src/index.css`
- add the class `text-red-500` in `src/App.tsx`
- `git commit -m 'add tailwindcss'`

Next, add prettier:

- `npm i -D prettier eslint-plugin-prettier eslint-config-prettier`
- `touch .prettierrc`
- fill the prettier config with below the content (you MUST use the Edit tool instead of Overwrite)
  ```json
  {
    "printWidth": 120
  }
  ```
- make the following changes to the `eslint.config.js` file (merge all the changes into one and edit once with the Edit tool)
  - add the imports `import prettierPlugin from "eslint-plugin-prettier";` and `import eslintConfigPrettier from "eslint-config-prettier";`
  - add `js` to the files array along with `ts` and `tsx`
  - add the pretiter plugin with key/value `prettier: prettierPlugin`
  - add the rule `"prettier/prettier: "warn"`
  - as a last argument to the config function add `eslintConfigPrettier`
- add a `format` script in package.json with `eslint --fix .`
- run `npm run format`
- then `git commit -m 'add prettier'
