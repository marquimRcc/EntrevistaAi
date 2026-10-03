package com.guilherme.entrevistaia.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

@Configuration
public class AsyncConfig {

    /**
     * Executor gerenciado pelo Spring para requisições de streaming SSE.
     * Utiliza Virtual Threads (Java 21), permitindo alta concorrência em operações I/O bound
     * sem consumir threads nativas do sistema operacional nem risco de esgotamento de threads.
     */
    @Bean(name = "streamingExecutor", destroyMethod = "close")
    public ExecutorService streamingExecutor() {
        return Executors.newVirtualThreadPerTaskExecutor();
    }
}
