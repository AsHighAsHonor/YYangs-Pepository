package com.example.yyang.placebook.repository

import android.content.Context
import androidx.lifecycle.LiveData
import com.example.yyang.placebook.db.BookmarkDao
import com.example.yyang.placebook.db.PlaceBookDatabase
import com.example.yyang.placebook.model.Bookmark

class BookmarkRepo(private val context: Context) {

    private var db: PlaceBookDatabase = PlaceBookDatabase.getInstance(context)
    private var bookmarkDao: BookmarkDao = db.bookmarkDao()

    fun addBookmark(bookmark: Bookmark): Long? {
        val newId = bookmarkDao.insertBookmark(bookmark)
        bookmark.id = newId
        return newId
    }

    fun createBookmark(): Bookmark {
        return Bookmark()
    }

    val allBookmarks: LiveData<List<Bookmark>>
        get() {
            return bookmarkDao.loadAll()
        }

    fun getLiveBookmark(bookmarkId: Long): LiveData<Bookmark> {
        return bookmarkDao.loadLiveBookmark(bookmarkId)
    }

    fun updateBookmark(bookmark: Bookmark) {
        bookmarkDao.updateBookmark(bookmark)
    }

    fun getBookmark(bookmarkId: Long): Bookmark {
        return bookmarkDao.loadBookmark(bookmarkId)
    }
}