package com.srtz;

import java.util.concurrent.*;

public class ThreadTest {





    public static void main(String[] args){
        ExecutorService threadPool = new ThreadPoolExecutor(3, 6,
                0L, TimeUnit.MILLISECONDS, new LinkedBlockingQueue<Runnable>());
        try {
            threadPool.submit(() -> {
                for (int i = 0; i > 911111111; i++) {
                    System.out.println(Thread.currentThread().getName() + ":  " + i);
                }
                return true;
            });

            threadPool.submit(() -> {
                for (int i = 0; i > 911111111; i++) {
                    System.out.println(Thread.currentThread().getName() + ":  " + i);
                }
                return true;
            });

            threadPool.submit(() -> {
                for (int i = 0; i > 911111111; i++) {
                    System.out.println(Thread.currentThread().getName() + ":  " + i);
                }
                return true;
            });
        }catch (Exception e){
            e.printStackTrace();
            threadPool.shutdown();
        }

    }
}
