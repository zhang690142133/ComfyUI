import { execSync } from 'node:child_process';
import * as path from 'node:path';
import { fileURLToPath } from 'node:url';
async function main() {


  //process.stdout.write('\x1B[2J\x1B[3J\x1B[H');
  const args = process.argv.slice(2);

  const __filename = fileURLToPath(import.meta.url);
  const __dirname = path.dirname(__filename);
  const targetDirectory = path.join(__dirname, '../');
  process.chdir(targetDirectory);


  const project =  args[0];
  const verison = args[1];

  const tag = project + ":" + verison
  const latest = project + ":latest";
  const repository='zhibeiyou-docker.pkg.coding.net/gaoweiyoutongyiziyuanguanli/gwdocker/'

  let commond = 'docker login -u gwdocker-1718293966945 -p a53e9d4f7aedfbc3958f94aeb1b9e5974982b800 zhibeiyou-docker.pkg.coding.net';


  commond += '&& docker build -t ' + tag + ' . ';

  commond += '&& docker tag ' + tag + '  '+repository+tag;
  commond += '&& docker tag ' + tag + '  '+repository+latest;
  commond += '&& docker push '+repository+tag;
  commond += '&& docker push '+repository+latest;
  commond += '&& docker rmi '+repository+tag;
  commond += '&& docker rmi '+repository+latest;


  console.log('commond1', commond);

  const child = execSync(commond, {
    encoding: 'utf-8',
    stdio: 'inherit',
  });



}

main();


