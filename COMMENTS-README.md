# VitalVibesDaily Comments System

This document explains the implementation of the comments system in the VitalVibesDaily blog.

## Overview

The comments system allows users to:
- View comments on articles
- Post new comments
- Reply to existing comments
- Like comments

Administrators can:
- View all comments across articles
- Delete inappropriate comments

## Implementation Details

### Storage
Comments are currently stored in a simple JSON file at `app/data/comments.json`. The file is structured as follows:

```json
{
  "article-slug-1": [
    {
      "id": "1",
      "author": "User Name",
      "authorImage": "URL to user avatar",
      "content": "Comment text",
      "date": "ISO date string",
      "likes": 5,
      "replies": [
        {
          "id": "1-1",
          "author": "Another User",
          "authorImage": "URL to user avatar",
          "content": "Reply text",
          "date": "ISO date string",
          "likes": 2,
          "replies": []
        }
      ]
    }
  ]
}
```

Each article's comments are stored under a key matching the article slug.

### API Endpoints

The comments system exposes the following API endpoints:

#### Public Endpoints

1. `GET /api/comments?articleSlug=article-slug`
   - Retrieves all comments for a specific article
   - Response format: `{ comments: Comment[] }`

2. `POST /api/comments`
   - Creates a new comment or reply
   - Request body: 
     ```json
     {
       "articleSlug": "article-slug",
       "comment": {
         "author": "User Name",
         "authorImage": "URL to avatar",
         "content": "Comment text"
       },
       "parentId": "optional-parent-comment-id-for-replies"
     }
     ```
   - Response format: `{ comment: Comment }`

3. `PATCH /api/comments?commentId=comment-id`
   - Likes a comment
   - Request body: 
     ```json
     {
       "articleSlug": "article-slug",
       "parentId": "optional-parent-id-if-liking-a-reply"
     }
     ```
   - Response format: `{ success: true }`

#### Admin Endpoints

1. `GET /api/comments/admin`
   - Retrieves all comments across all articles for administration
   - Response format: `{ comments: AdminComment[], count: number }`

2. `DELETE /api/comments/admin?commentId=123&articleSlug=article-slug&parentId=optional-parent-id`
   - Deletes a comment or reply
   - Response format: `{ success: true }`

### Frontend Components

#### Public Components

The Comment Section component (`app/components/comment-section.tsx`) is responsible for:
- Displaying comments and replies
- Providing forms for submitting new comments and replies
- Handling likes
- Managing loading and error states

#### Admin Interface

The Admin page (`app/admin/comments/page.tsx`) provides a simple interface for:
- Viewing all comments across articles
- Deleting individual comments
- Navigating to the article where a comment appears

## Accessing the Application

The development server runs on port 3001:
```
http://localhost:3001
```

To access the admin interface:
```
http://localhost:3001/admin/comments
```

## Future Enhancements

This is a minimal implementation. Here are recommended improvements:

1. **Database Storage**: Replace the JSON file with a proper database (MongoDB, PostgreSQL, etc.)
2. **User Authentication**: Integrate with an auth system to identify users properly
3. **Pagination**: Add support for paginated comments for articles with many comments
4. **Comment Moderation**: Enhance admin features with approval workflows and content filtering
5. **Rich Text**: Support formatting, links, and images in comments
6. **Notifications**: Notify users when someone replies to their comments
7. **Admin Authentication**: Add proper authentication for the admin interface

## Testing

To test the API endpoints, you can use the provided test script:

```
node scripts/test-comments-api.js
```

This script will:
1. Fetch comments for a test article
2. Post a new comment
3. Like a comment
4. Verify the changes

Note: The test script is configured to use port 3001 where the dev server runs.

## Security Considerations

The current implementation has some limitations:
1. No input sanitization for malicious content
2. No rate limiting to prevent spam
3. No authentication to verify user identities
4. No authorization for admin functionality

These should be addressed in a production environment.

## Additional Resources

For more information on Next.js API routes:
- [Next.js API Routes Documentation](https://nextjs.org/docs/api-routes/introduction)
- [Next.js API Middleware](https://nextjs.org/docs/advanced-features/middleware) 