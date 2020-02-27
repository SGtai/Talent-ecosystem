package com.cykj.net.service.admin;

import com.cykj.net.javabean.Adjournal;
import com.cykj.net.javabean.LayuiData;

public interface AdminJournalService {
    void addJournal(Adjournal adjournal);

    LayuiData journal(String account, int page, int limit);
}
