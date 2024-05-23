import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { config } from 'dotenv';
config({ path: `.env.${process.env.NODE_ENV || 'development'}` });

async function bootstrap() {
  const app = await NestFactory.create(AppModule, { cors: true });
  app.setGlobalPrefix(process.env.URL_PREFIX);
  await app.listen(process.env.PORT);
  console.log(`Server listening on port: ${process.env.PORT}`)
}

bootstrap();
